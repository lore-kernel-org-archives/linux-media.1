Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB38F426687
	for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 08:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791708995; cv=none; b=SahdWb4MWZ/2Mi0lY731IcjkAhR+zH5RcB3ZISO39u9Vqsx8vIT0IXODGX+0ybtMOmrfzgD6Ta7lmfKacNTwefDEVr0EcQXyFPnHjVTk3rdOcHTCurYuYgoOvGYITjKEbawSUrhq4zntPWLwllg2J34KiCFIChzlBiJc+9BT+PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791708995; c=relaxed/simple;
	bh=trXuCyofDSoyesvjUgDrKmbXdt/YLOeYazvd/Osj+lQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eirA1mQXsl3kwKS8LhowpEuf7Ivgg0D14PUXBigr2/bY5/98lg+H1M7aiMy/UuhS/xBYIVUc6pbAs+pbxtHWXZodnSTVWg8gZ8EKdwmXnxNnnT4OmhJQKtHgy93cGiqJTO1cxzlouagUyHSUXM/MrKZODeHrL7AZfGDzIE0DW4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HCf+9AJj; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HCf+9AJj"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2e6df2742cso154964066b.2
        for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 01:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791708991; x=1792313791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dKOqZxKxSOHNw25+e85CqVx4B1361RF8kK92P+D5pVQ=;
        b=HCf+9AJj68FQjIxYxllcXMPh/xLWNhDxiwo2416kSNqHz9iEkEonTNZ0QTH+Yt+uWg
         +vJGQ4ibw2DaCwgZaaBa822cYfUtKvqeK9yPyjgXlGRvkCsqD2kHCUJc46s+qrWAeW9s
         x0CI+g+36a+2AANQEActK1Zog4eQuF+G9vtYFogZZnob3kMx2EzHaHQ+dVwT2NmurOBI
         Mf9FhnqzJHXeY3Y7TTnqbwWE/lSmHy91caoz52tlv5uo8QjI2autT/HQ5qF3UTdLoZOb
         bCLBrRViqKctlHnPtoO3R3qJiYsz+Uqbox3IpsXQFHlrFt+anLfctQCEtIs608+sxEU8
         Kkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708991; x=1792313791;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dKOqZxKxSOHNw25+e85CqVx4B1361RF8kK92P+D5pVQ=;
        b=N7SoRjSIylYACNo0L879NkeH6YgrTzIfQ6QOFtp/EShJnZlrQcNiCbzedCYIgwujIb
         Ox5ToYFZBbxtczGoEaCnLT9BGElRTSLZi3aiGX2BDiYozrOaWMFu09bIfh65MBxpHioT
         lqwflHwug04D58+VXn8DWptpsW7gdQMfrcNWV1v9xqrGj7VDyUQVV4UGo4aqjm2vRrEQ
         v97wfhWUOyL6xdun+E9X/pVOOUw/Lz5LJY4oU6obFRWAEO1h7eGsI+esldeDSTyW1HIB
         nsne0MvmkhYGhVhQBsw/07/S4j9ZfiO5VoU5JUksRkRvcKEpInmscjVdqe1pCoP5XhyN
         6y3A==
X-Forwarded-Encrypted: i=1; AKwUvBzXLD0KPmJxIf0BVpRXpAOz7UL+FW26H+LN62jAeS+kBcukfvoGG7MpY6CXC6oEPx3a9O+LXULtkWgncg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLkT9yCgBtQV665ducToArfQxQIRDkcAwwzN7mb1fiBrRR/sB7l
	ATqIQM2ixenum3dr8kwubm3+aL6LHMiB1jnQIFtUIckV0nNiNa0qPBq8TZbPcGOkbGyRAeAlw97
	mlFLIZgI=
X-Gm-Gg: AYBFou2QDXcPXmHh5ETqscLlkj+7VUWZ45i8NyPjtEaiYOrriS+o91YMF7NFfWR8kB0
	KFpQDfwSyfVoX67hpyYVsI+zX0Bt5jIqB22f4upbn2qPs8BPgyEe2PIsJe8lUilgmOI7Dmryhg0
	S6OqHppxErKsqxxgqRExlbOXfOKzuo4ZyoIELbD2snkATcvUhazaopc2hFVazb77DfeNuyNQbHh
	cVjpnJtT9WZFSib/UfKhwJwiJTssju4h35Y8iKgdct7oxykuel/gDNVweKTDSkpHq4xYkihBUJo
	+CUz/EWlX7hWypTdVrT8cXn2zZu1aUOirOEBi0Du8aQez6DkTALRJZY/YtpeoUj9tc1Hz/Yf1Nb
	TBF3YIdddseZpgEdXh/1ylhgGPutwECr0RfnaMhrAoORvhl3mz1UNrtdWFI4bt/YCxOSxQrEZTq
	Hbt1ntYbBKato/0TIiv8a/YyZcqOe1jhA3hMO9AF+iY+MZwkTpGPzY/ppsYA7AyFdPHbO/od+1Q
	w0oifsCkiAe
X-Received: by 2002:a17:907:940b:b0:c2a:ef15:2be0 with SMTP id a640c23a62f3a-c31a9ffee01mr693409466b.24.1791708991035;
        Sun, 11 Oct 2026 01:56:31 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.165.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae59f9sm334413466b.80.2026.10.11.01.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 01:56:30 -0700 (PDT)
Message-ID: <a6e5dc34-c2e7-4a3c-a0e4-fb0a3a28cece@linaro.org>
Date: Sun, 11 Oct 2026 09:56:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 08/13] media: qcom: camss: vfe: Add support for VFE
 1080
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
 <20261010-kaanapali-camss-v20-8-63e98ce9ac0c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261010-kaanapali-camss-v20-8-63e98ce9ac0c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/2026 17:01, Hangxiang Ma wrote:
> +		if (!vfe->res->reg_update_after_csid_config)
> +			ops->reg_update(vfe, line->id);

So I'd prefer to have a discussion about if we can move all of the 
updates to one method.

i.e. why should any of the updates happen before csid ?

Sure vfe 1080's documentation makes some sort of explicit statement 
about an update that has been implied for some time.

My question is why not gate all of the updates this way and make this 
not a flag but a global behaviour ?

---
bod
