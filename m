Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398570;
	b=zSHPx6fRXLD6IPUgDzL9uVAa1K0ytvoWCImPAubCW6nGixMZvNXygSaunhpYg9IZiBKd
	 18ZKGPRuDF/bO9025dbq0tMRUI51l8Z8QNIe2d0UsBmbnGwrZoVUzDWwpBHysO1tuO53k
	 yHdNL8vx1m5S58eQYRLsPnWloJfkSqY7QSNGyp/5xEgWnVpE+HdKtcWaCm5/0hxibKnI4
	 0EB+f+y5yrFZ7hnS/9lCkZRddtMWpqoH5AL7WMum1PDU+xqe/9NpMQ/WlX3ixkNZrWg7T
	 5V8h6MGSSARsDRSb2CWHHzO8oTJmt3TkiA/2chiLm1XB33lsSoqeyYEciepx4bWtmyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Mf3ojcAaOl5Wd2bB/OvSpA9q4iDAVUFZx+UCDfwTy74=;
	b=WpcDwhfThz84hqULyw8LcUE3NOeYsmbKWdtfOyqVqCkAZUVNjaNoBr19Mbh7e2Gt1EDg
	 5KbZwMfEBuMXEaV5Q6QlIyomz36f62rYBuz+I5a3oFHLLGoJz70M+8zBYActxwOhZQcrH
	 /Rcq2dEmHjfSmxMGqfB2KA140BGimyWds9MekQ9h51TYx6pBzIXWUXTnK54C/b09Zpbmw
	 ntg5I4OemkYoISEgG4aqCcggDs456+gO14GJPy5QECzbmSt4mUpxC0lVHx7uORn7+b9v1
	 VgmPYrrOYhjeqVS9bQVpu4GL4t5xiqlsbvKZFHoOEqY51udiazOpthD7IzfQ+ycUF4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Je1CYIjf;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7FF606A327
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 12:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB7FF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Je1CYIjf
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49412eb1474so1905119f8f.3
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 04:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794398568; x=1795003368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mf3ojcAaOl5Wd2bB/OvSpA9q4iDAVUFZx+UCDfwTy74=;
        b=Je1CYIjfuwflh3C8ZTO7fGiG3VT2JZ4/KZsAnIckMk5yyFTVUjMTyMSMVoowIwUALe
         rIx+YCcQd5d3c/Oo7ywHWhe+3KSTQ7o6rFpU0FKq7oz4uEO2xHVWkEcknh525ow1mgCu
         gWFknAYgozrE3xkB1Hf35d8etynb8NZA5amXxyEuDKuHJdX9BiOMQOk4XO6ih4oDz5ll
         jiNbUTntFWcfE3xAvdYsPO01gTShdzNlx4xruDnGGl89qAWG/eS5QeVSu9Tt1rrguObP
         WWiW9en2E3WuuFqlZwdLZQMuWBF1+OevnHMcH8EoqrsFJwJLse2YUIb6yJUacp0hHv8D
         xyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398568; x=1795003368;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mf3ojcAaOl5Wd2bB/OvSpA9q4iDAVUFZx+UCDfwTy74=;
        b=l3pN7teAMLWhmHIXG6NM74fjOSLiBn/B7zCHveJ4LBjO09pSP1P5Ju7ppTHzjY397e
         DOSbLMhxrf2lf9syrvZYCKy8+IjIAtQBDTguCeDvzbjeaK2ovXCi8USfZeogbE7TVPa0
         noNibl9EOJkOBvGb+RNJkSMhRpwhWDclaVZmG6C7ZqX9c3srMDUxiyOVO6zPGUKiElZJ
         TRF8Xul+WzCK+auBEi86PgLPtM1/dlF+HgfuSbFI2bL+SfFKtDZYyzExBzZmxaNstrIM
         OotWAIfe/BaN9yV+4e48E4S/hu49BkbptXA6Z474OQcuTMjvCtzGUhHEaVgz4iMqgSG9
         fCyw==
X-Forwarded-Encrypted: i=1; AL+hErEeQ+o3RbaFOXhIzpMbclPypDlgEBw8g13txQC3xz9VyHYnpG2fo8WCRCPY4E6ShMESc54c66qK1rIAZQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9BAFTM0ti38BOQUFIFxMpg3P67Iavc/LJq8liYlHHkPZA2vEbQ
	dYaCdfp3Wyk1lo9rpqkK0bPbzo3uubAktExSKUTt7BMngxYh+dYoDYTLZuvLd2VXqyQ=
X-Gm-Gg: AYBFou3YQjEArYSJssbImlcpIHoEunxXSsnvH0yu/Z2qovkw9dl4plwmOtftmnzFv+D
	irrJZnT3PTmkh3+rmhHfh8n/yAdpNhrb+ulvgRAZQEecI9WPBdIb59ODp/dxjcOA/gSvv5gquDC
	4aoQ6XU9IoLUajfJDFcPSLOQn/W4B+1KgyraBFhQMxRnMqaMnivt4iEAvVLv6Gk5hod5eIaaZwM
	DQmlr+moqMBk6G/NJ0oe7eDkGs9KPj2ByYxmmmlGvuOkOfkjlZI9WTO1bIMTj2xFiIWEL27tp0K
	6v78/wj+UYU4JYB3+DNGRT+O1wn4TXxFPNYAG1J1xn6mVK3bgGSMyv6bs5U0UwtlX80T1a4yaE+
	VOcTeH4TKI57wgctYiKz1SwAdd/iq32UZeZSb3sa1cU5TeKeqHdjiNhM/5skVYdgMPnFEda+ooF
	d8Y/9CQNIPa0o15w/pOkrh+YU5wyYFfyB8tPEPfNNwk+GETjShXE+1W+3xRbyrQ2aqLwASe26CQ
	EreM9WcFUToCRcidEO7TkagXYA4gDB+2zizul9dsmDv96o1yMp1YCWFe3p0NAb2foMYsueLzPrN
	ve6Ye7wEfiAO4jkrI8l+AX68GkfL5+GR5RGuXCw3
X-Received: by 2002:a05:6000:420d:b0:48b:1a0:5630 with SMTP id ffacd0b85a97d-499c86a10f6mr3780756f8f.41.1794398567805;
        Wed, 11 Nov 2026 04:02:47 -0800 (PST)
Received: from [192.168.0.167] ([109.76.11.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835c377fdsm8869991f8f.21.2026.11.11.04.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 04:02:47 -0800 (PST)
Message-ID: <3713bf13-cec6-4b02-a29b-8f76070f03b3@linaro.org>
Date: Wed, 11 Nov 2026 12:02:45 +0000
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
Subject: Re: [PATCH v7 4/5] iommu/of: Require reg for iommu-addresses
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Vasant Hegde <vasant.hegde@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>,
 Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
 Eric Auger <eric.auger@redhat.com>, Joerg Roedel <jroedel@suse.de>,
 Srinath Mannam <srinath.mannam@broadcom.com>,
 Oza Pawandeep <quic_poza@quicinc.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Alex Williamson <alex@shazbot.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, devicetree@vger.kernel.org,
 kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-4-5c0f72083e52@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261106-add_iommu_ranges-v7-4-5c0f72083e52@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2026 17:14, Vikash Garodia wrote:
> @@ -257,6 +252,9 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
>   				}
>   				type = iommu_resv_region_get_type(dev, &phys, iova, length);
>   
> +				if (type != IOMMU_RESV_DIRECT)
> +					continue;
> +

This change is not about requiring a reg though, which is why it should 
be a standalone patch with its own justifications.

Basically the patch should state why a mismatch is dropped instead of 
being reserved.

---
bod
