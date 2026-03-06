Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BA827A904
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 17:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772819661; cv=none; b=tiBjebdj0IP3KetaH3EX+M+hYt/mACz1PvnVHY/50HC2Jisox8ij7qzm6uRdoEHUqc78uhxKQzIooro56E8gsrZjRxXk35leemn732f6jvpoX+tBfx+pj2X9BcvOMCYNl7QJmRLojdXhGGZQqyvfHUh4WuVcHUk3MzvT8RY6BUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772819661; c=relaxed/simple;
	bh=/VsPXwxWJlIcPCgsJUJbbPLXhINGEzT3C4S9tPtkYVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XzvwVDWh8uzSWvHeEI8H6CD4lFQRDCMdNlkrV8kq/TsUQUhxRmBTY5JKVrYuzkt+KxYilepKwzfJLNvtEKJzgQlsPp9OEHCsGPfkbzjvVeUL1E2wXzMtU5FRbaqbXUvV4ivKIhtGxk3QvwP6Fo//U0k4iKakI3ikcynUIvGW84c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E9N1DgVY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E9N1DgVY"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4833115090dso98432975e9.3
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 09:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772819659; x=1773424459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zPR2NSCBxtfa9Ic5nUOZ/h7s4cDLhxXSrBsYcrsWKZ0=;
        b=E9N1DgVYiAHqomB9L0YiKaToxGVa/wqm2LTc/T8UyvWWy9MDNrwWB2nIgHvbRbk7Nx
         jcfNi8ZZRXZxQyTmnbBkaIatvkB0zuuy1Hlpvse2XQ9GcRxOi0pGC4HPARONhdEz/FET
         jbQP/X+iluMbY/NGmxEtt7vsHicUoT/HF/tIWyDqEGoeKSqogWzXrK4d87nszQrtHYg+
         QFotgqsTFiFWtY9OVkqmFLtZOhA2xJVmhJpHSUrmpA9j6p0d5wrfeSHo9SIKDaocG7MH
         XBVfhDE0izR9Ic/ZZnZtLsA7g22Gn5y3pR8BJw+vZ+Y5xxsekc3b+/D4sLJEMACdVyjV
         l1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772819659; x=1773424459;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zPR2NSCBxtfa9Ic5nUOZ/h7s4cDLhxXSrBsYcrsWKZ0=;
        b=XO9O5UBqZZepohK6nc2pBHwtTWBYqsJh1/p8sfwBK99akBMNbGm9WKI1RIzeLczyYf
         USBu7Xlcsbf4dfqhONDYgmNjKgIs4SD4bc+pPIIXXoCBlRLIZsGdSTqLppPKw10O+qOR
         F0ezfBrQv6HCbPaCGmW5kM/N+F50XfnUhHf9Kz8JMSuqVI0xIwJDZuvnCP42rB/ShQKA
         wVxEvOMR4yvVLCTJhuxoSr6Loxf4woI8jFo8/qlq2bRq5bkhbPzQeIENJJasQdWBjd5v
         CxqJ8Ij8ql/GzHRkufCZarwiwFzTdCo/A+jfYcaA9ohYkT8EfjRkD0md+GvqRkqUCAa3
         olow==
X-Gm-Message-State: AOJu0YzfsZ/05AzhpRB9jYaJuLkEMqsxvJJg5Q7AwR/cMy6lDiK5rZZj
	2ugld/f4oj1vnEYbjMEtmbK+H1NFeYNWDSEXzFJT8AaUV9wpKU7flpqZ2LIhcvcJAmk=
X-Gm-Gg: ATEYQzwou0N2iMy6Q6aqPRCTqSOTuVrtdtDu9Ao32kIgVoPh9fnHOCW0jbUE/wrpKvQ
	EdWcNHxqeRpnqCQYzteEol9OwDVWCrHLip3Aod+nbMt7fRCV5wzlWyS7I9SGUiIVtaSsCkhaaS3
	kjTjSH74mQXCZUiOjTRXGXfaBPM8D+KnCPsN/hnXMfUqF9pyXQxS4J/AdTFEK5B1AbArrHweiFU
	Y/K7kK5u4Pn6427CoMJa0wX7MBuhH0OMjbVCdhGeORf/7j3BaTrxkq2KlK+9QeOMq8FfI8J/2Dj
	OOMJ0V2G8dYstPWd/f3Tr+MYG0LagW7UwC9wZSM5YzZX+LPANNiyn+WpG6c4LcYpVOMnp9PF3VL
	DJNEpQsDjS5vysxHK+dsXXorJm/irjTAlB73xDiVUl5cJo+pHUSyr4mnosg2WAk1vQEnPSgri/t
	2kH4b/9ZTT/133cxGM7K+g+2U8UloCdBxES8s=
X-Received: by 2002:a05:600c:470d:b0:483:7783:5363 with SMTP id 5b1f17b1804b1-48526967a89mr49871375e9.26.1772819659148;
        Fri, 06 Mar 2026 09:54:19 -0800 (PST)
Received: from [192.168.1.102] ([93.107.81.172])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2b9fbsm5405023f8f.23.2026.03.06.09.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 09:54:18 -0800 (PST)
Message-ID: <85680596-7e3e-46ff-b361-d6a736558504@linaro.org>
Date: Fri, 6 Mar 2026 17:54:15 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] media: qcom: camss: csid-340: Enable PIX interface
 routing
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
 dmitry.baryshkov@oss.qualcomm.com
References: <20260306140220.1512341-1-loic.poulain@oss.qualcomm.com>
 <20260306140220.1512341-4-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260306140220.1512341-4-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/03/2026 14:02, Loic Poulain wrote:
> +	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PADS_NUM - 1];

There must be a better way to identify the index than a hard-coded 
assumption like this.

The params structure.

---
bod
