module RTFHelper
  def fetch_from_rtf_doc(doc, pattern)
    index = doc.sections.find_index{ |item| pattern === item[:text] }
    return nil if index.nil?

    # Starting with next section look for a section with more
    # than just whitespace (typically tabs)
    index += 1
    index += 1 while doc.sections[index] &&
                     !(/\S/ === doc.sections[index][:text])

    return doc.sections[index] ?
               doc.sections[index][:text] :
               nil
  end

  def fetch_client_name(doc)
    first = fetch_from_rtf_doc doc, /First/
    last = fetch_from_rtf_doc doc, /Last/
    if(/email/ === first)
      return last
    else
      return "#{first} #{last}"
    end
  end

  def fetch_client_email(doc)
    email = fetch_from_rtf_doc doc, /email/
    return email.slice(/<.+>/)[1..-2]
  end

  def fetch_date_from_rtf(doc, pattern)
    begin
      datestring = fetch_from_rtf_doc doc, pattern
      mdy = datestring.split('/')
      return Date.new(mdy[2], mdy[0], mdy[1])
    rescue
      return nil
    end
  end

  def dallas_policy_from_rtf doc
    policy = Policy.new
    policy.provider = Provider.find_by(name: 'Dallas Insurance')
    policy.number = fetch_from_rtf_doc(doc, /Policy/).to_i
    policy.category = fetch_from_rtf_doc(doc, /Policy Type/)
    policy.alias = fetch_from_rtf_doc(doc, /Alias/)
    policy.account = fetch_from_rtf_doc(doc, /Account/).to_i
    policy.client_name = fetch_client_name doc
    policy.client_email = fetch_client_email doc
    policy.in_force = fetch_date_from_rtf doc, /In Force/
    policy.last_change = fetch_date_from_rtf doc, /Last Chng/
    policy.last_renew = fetch_date_from_rtf doc, /Last Renew/

    errors = []
    [:number, :category, :alias, :account, :client_name, :client_email,
    :in_force, :last_change, :last_renew].each do |param|
      errors << "Unable to determine Policy #{param}." if policy.send(param).nil?
    end
    return policy, errors
  end
end