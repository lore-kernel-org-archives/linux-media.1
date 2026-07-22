Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD1E470E88
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 21:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784755204; cv=none; b=cWiw9TTUhUcB+l+R7jnD8xpQ/54K3neVyfI4T+fU6uHwk161ci9YAjIOwF2sYlXju4BeUJ0s68OiSVWSK8Juby2GnV6teBcTBbVr7gDZzR0dEWhQKS9hGWGCXUcmp17FC/xp0jjJRUUg07OIEjhuEbIH7xKFKphAjOABFTxSREw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784755204; c=relaxed/simple;
	bh=ZMqplz+CWfwkhFScdALPCw3tjHBTwhMBIDW0MQg7n4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jc7+EJH0E0GL43dxh5j1KtXEfmxYhCeCwykGgdHnCTabwNE8+5xr9uoQ0NWCEs69kZDfSTcteYi/diL3Q8vi+QFwBUPn9ZIDmReIvHl9uVFlZ1lPgUjDqfyNditre28EcqOJ4blBoEnN8TuOlofOen3a177A7HkiboLF7fqfDDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qOhcKkSM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qOhcKkSM"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493f75f7172so101140085e9.1
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 14:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784755202; x=1785360002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LB19uSaB2dUKGpvvlp7HGJ0LJbGfFX8aMA0zsxDLx+E=;
        b=qOhcKkSMmIEcAgkrcu6DnI0bpKvWnNujveKhoBCSF7BdXOZzqNaC9rpGzfrX3ro/71
         he1BehaaHwAxgC2JKTQHAsqZuZzH+aQ8vh8NCzFag5o2Szx62hV1mdiEzywxx4sBFMpQ
         97WRVquiQc7s9wccqx8mPLt0w775DeTrlp+WiRN5FG9palDcagcYekFMll+hHiX75G/I
         dt8vRQ0Wj+BlZopre6WYmwGt3xny5nshfoUelrWPVeApE/9jVit3xosL6hLGTLk8GXfd
         VGUmQi2ya90XGxxtOKSgoGqFegGNezkJEpXFY6OIE1Fu1XC9Ys6CVonxwe57+qSGwqfZ
         tJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784755202; x=1785360002;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LB19uSaB2dUKGpvvlp7HGJ0LJbGfFX8aMA0zsxDLx+E=;
        b=ffritwbDLHwaRtdivY+CYfZBAZlqprGwTAWNgigqUtmwF/ejLQ4elfYx/My7ldzuTm
         xxn9621dps97Xt2lh2qEnxJ48RsOXMLHKcfVye4ChIw6mcxE4GSkjobT2lB89f9kiRLN
         Ff36RpWaoUQpTV1Ag07Os9nGmigVi8ybYrbRoXHUjxVxn9ijlXnaeB93tS3YW4hex4mB
         kEiYYIHxsPByraq4jH5I6Mhe8K966KSmKFSil3uEgFZE3b6rUAhovA4/T6NvrtxMfxx/
         k4tt5u1EYoJHrOqsZOScyGTmONr5QZJ9qekLyOdDx0Sm5YnWedHFJFTjwpqIlI8H5S1J
         /qIQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDc1vEGmFZlJjwHyqurk6JHnIG0PSX8Mu/6w+9b+EF06IfygR4L6smqwrmlzNR77oZvdQdCbLPYm1PoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwD3DVBZ8QolhPvzoyZEY5jzNg43TW7fKYLoJT0ZMe8vt/xv4qM
	Ia3a3iBXhlwWvKVpwo/Ngg+khplaa2Q7apAf6Vm8LCJu5iPccGYxeUUx/xzK362+UyE=
X-Gm-Gg: AR+sD12HT4MhWyDIaaHLoAAAQSWZinSvodulSEg3oa1U44j4rnNQzuXFHS4SIk6AMrL
	5CQS/l9Bz1EQaY1z4TnsMqsfUKEGEzIIfANU5WoLHWADezQqEkR0BOmouNmi9AJkmAcWLzrFYGG
	JM1jRV6AhY5ETSYBFhoD0blF4GnuX9+o4nJOXcshzGPLW1V9iHYCjxLfBJzhLbaytZxc95U9300
	MZQUHYIe6JUlToYCvTi6qXmL74CaQ1FR0WgOs9Wtrl6MxjoRw3/VTWNF1xul5X6t5IKvvGD4AF8
	sb0xraWYcXIHdY5EtGjm+4F5cF2aMrqEx+MSNH5HUv2gmsG4oDPbfSp01U7eGpNzX28zYfN0GQU
	PyjRDEITGwqm54avYrsa3OxZWLSIqFgvtH84WvmiHDmCAqQ6F5sJYMc7GfAgt+2ufu96Av60s7k
	NCixyx+Ee8lsaoZQ==
X-Received: by 2002:a05:600c:c098:b0:495:3a52:cd7e with SMTP id 5b1f17b1804b1-49573cf7758mr3304065e9.25.1784755201577;
        Wed, 22 Jul 2026 14:20:01 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.14.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5a2sm10026935f8f.7.2026.07.22.14.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 14:20:01 -0700 (PDT)
Message-ID: <4a8c0848-7f16-4752-93b9-e5e30c8ca0b8@linaro.org>
Date: Wed, 22 Jul 2026 22:19:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: Add "gcc_axi_hf" to 8775p VFE
 lite clock lists
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260722163658.409872-1-johannes.goede@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260722163658.409872-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/07/2026 17:36, Hans de Goede wrote:
> The "gcc_axi_hf" clock is correctly listed in the clock list of the
> 8775p 2 main VFE-s, but it is missing from all the VFE-lite clock lists,
> causing these to not work on platforms where the firmware allows turning
> off "gcc_axi_hf".
> 
> Add the missing "gcc_axi_hf" to fix the VFE-lite blocks not working on
> these platforms.
> 
> Suggested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Needs a Fixes: tag.

Then add.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
