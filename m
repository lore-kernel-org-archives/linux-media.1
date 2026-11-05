Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876628;
	b=uZmygajVJWMT/OVJHi8iHZw8b8yH+69iqKyI17UGZSivhJGjtpuTwnPyxmh6dlK9y2U1
	 ByNRomFItLrYGs1XcJKK9w5j5Kr193ux17dM0kFgU4bYrfSpsZFkmA5h4sOeHJgIC1zXH
	 sE1sB859IY5RetM3pzIaHnv9WjLfy0yZ38rERb1xAnwKBx8rm9dLxlEq8ZJU7cyIarr4t
	 T9C4koZoofHfTH/xpPJE3vJ1vR8E+1kN/M+L4+BipVRejStJhM4WQyI+Y2Ks3EByj0A+p
	 rbhYDixpmrgaxzvgl6ToQ2liUokq8t4ZRv/Z/nllxQvOdnIDqAW/w3lrKMVkyDBC7GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Gap8H+IWEcYnPmZ+NpEifKFD4ejmr9XNlelO2dmBy3s=;
	b=R0HB3bYGRWoVsf9xqffRvLgJo94OpRMZdzhXftKUlbl/c6ZxoQykwVgBMqfcnlATOxme
	 8OuBGlEdM/cHF03YwmfbWYpa7RTskCJdAnclYxdZaXTkioXSq4D7PTcVS3Nw3SBqJPv5o
	 DucYFKP4IMFb1LqwSIuoW6ZzWXm54QgTsiMo+yy/PqaD0DmEmoP7zf1g7z42hR1PllX1N
	 /82Urks9xxUaiSW54tHpSIpIZDON/9y2twaB3SzQVlvq68RFvJO2/OZdciA0VKkw06bBX
	 29uNt1seFxvtRCh0gPjX15gYi8AkuRL9Aeq4sY8IgI7VGWeB2tethHwEaiCZ8OXkAeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZS6D4tKb;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D417B606A333
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 11:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D417B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZS6D4tKb
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1054626f8f.3
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 03:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793876626; x=1794481426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gap8H+IWEcYnPmZ+NpEifKFD4ejmr9XNlelO2dmBy3s=;
        b=ZS6D4tKbZiEH2mERnF+Ya/FotzT7AxXe9zZq6uitUC0iNulayZCb5AVtqeul+gaxjm
         Es6ERyVhbVZEVyshBUWs6W7AqPdzHtb3qURAq//6k1LUnB0f9cJ69onPW2nADa0b/AQ9
         RH8/TSuC/cmert5IvEsC3GDqI7Tip4oLqVEOuVpRk2HdPrSnm0nnyWXQbQgrqHY0Vjsj
         9yyliiv9jT11HqITClzAJrvZIdAXiqmc5tyIxFoO4RVXA8u9AAH3sS0jouyXvj7eZc6z
         JozuF292Oup3gUb15/SmhnZX3XHaq/VLHz/DST2va+7cGmRneaiFVG00jMGn0xE6ASPy
         C6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876626; x=1794481426;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gap8H+IWEcYnPmZ+NpEifKFD4ejmr9XNlelO2dmBy3s=;
        b=RL1xTOhmFuioRZyJcmO8FGeHJB67r7xQ54ZwMdgifa86jMutw55QpNplmKgxnGhmwZ
         UIwer6DCaQlrpmNIcNgUAWE2L9tr8Px5l7KNGUFPxfzLjh0iyWVDsyxzjUu3Ctz7JJmj
         nmD83WSRoBqWAnuXCjDCHrikhGn2uZGwfo7GJAijugnP5uzI8Cy6vtsLHi/L1H873awI
         8zM/tGZj9rO+umrunjFJrtCXNdWoOi6Vty8v/Ht5Rp3KTUo5o/ogm+YcQQqi3Zdx+7Zy
         1YhuXDD0R+m+cAWfbYZyevEfLc5WUln4B0sEP5RPNwun5cGTdz6+hBFNfL2oaFJOGfrK
         /+TQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgdA5AFumV+W+WCvnvC8g0Lpa1uq36rgFmrUrKiRmaLjwkZGMlhP052ggHoxymQa0WTJvGmlAntK7PoA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8OmFqVFqRg8L2wv/UhACn3ySTZmq7nKSkubpkzgA8EPzL0vmZu
	5fNHo8NrlwZPxaj12uDm/xx05Z+O2fDf3VABFpoHypySHg8hEKY/cqomCmKyXXacRkk=
X-Gm-Gg: AYBFou3LIoCpIdQQJACGtIqwmOmU/j1jJCvAvpum94GswJZcUmebBMUEXoL8thgTolx
	++fz/KpnkRSJs7SWvPcVgSbXRJNU5BCJRB9AHzsy/5yZftfUY0ULYXTqJtQSOpXBkfVaKxgW9wr
	GwpQSz9iuN63qEhZ71/WO7Lx5qfDfARowNB19/pttsM3VFS2YE6K3DZjhbVRl14a59JJXNxe9J2
	Pe4pz3aG2faJu7ikeS9ZpKLa3OkKISZxFUnxihbayksGlPNr8HjW1YfwAp6FOlbhl7B0uVb2Zwf
	5KXZEmncAyDzsKf6yv5VkaLofJHmGRY0B6GB+3RPMkTMKTDSJOgCI8CzFKJpZtDZV3CNZtrx5Tk
	U0SiT0peVDOlWpIcaqAPbHS8ayBHAearA0oEWvBJKN5DdHI1vyUZ9jXeYwXr93sMknca6uB6VM4
	1dLizxEATDlI68WwpuVb52vxCpBNfaOHQqA5C2Lz5KJTSH0GZ2JT4i0dgiySDD6Uma9unvpmHGR
	1OB4ByWi9LlLFl9z0uBvGpTvlxUi++bgWVa22pn6D/va73T4E3vqsoBBBMIIP60CNeCvLu34idr
	qUNsjJrRYqt0BevFYj+3BDoE3YSsY0pFHvkDNtU2
X-Received: by 2002:a05:6000:4202:b0:48f:bcdf:6f83 with SMTP id ffacd0b85a97d-48fbcdf713emr12222197f8f.22.1793876626103;
        Thu, 05 Nov 2026 03:03:46 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99a5dsm9321835f8f.21.2026.11.05.03.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 03:03:45 -0800 (PST)
Message-ID: <a59cdf0a-cb91-4c18-af0a-2e49e93ae620@linaro.org>
Date: Thu, 5 Nov 2026 11:03:43 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll>
 <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org>
 <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org>
 <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org>
 <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
 <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2026 10:45, Krzysztof Kozlowski wrote:
> On 05/11/2026 10:53, Loic Poulain wrote:
>> So some chipsets share the same IP blocks, with some block/phy
>> instances disabled. As a result, we need to decide whether we're
>> numbering based on active instances or on the actual hardware instance
>> index/offset. If we use active-instance numbering, then yes, it should
>> be @2 (CSIPHY4 being the third active instance). Alternatively, if the
>> port numbering is intended to reflect the hardware instance offset,
>> matching the register prop, then @4 would be more appropriate. It also
>> has the advantage of directly identifying the underlying hardware
>> instance, without requiring any additional driver-side mapping. In any
>> case, @3 is incorrect.
>>
>> That said, since the bindings have already been merged in its current
>> form, we'll need to preserve backward compatibility when addressing
>> this.
> 
> This is the input port to camss, so how is it called in camss, not the
> csi phy?
> 
> 
> Best regards,
> Krzysztof

When you have legacy PHYs the port number indicates the PHY - this has 
been the case since 2015.

With standalone PHYs the port number just means "input data port here" 
with no specific hardware mapping

Which to me implies the correct port numbering for systems which have a 
standalone PHY is {0, 1, 2}

On hamoa which supports both legacy and new we have to stick to the old 
way of {0, 1, 2, 4}

Since any PHY can mux to any CSI decoder the old port scheme should IMO 
be dropped for new standalone PHY DTs.

Not sure what to do about Glymur since the example is upstream already.

---
bod
