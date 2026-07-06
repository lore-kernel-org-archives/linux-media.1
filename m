Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B786238BF62
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 10:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333298; cv=none; b=WinFfQmeHh3MNMv0s9+HGEEYl0JU0jnCDoJtiGI9iO7bY1tXJvh4CLIvnHgChCbYMQYzz0G/i5Oo/1AiwBXXAJAkOsHk+MiC6dd2ZbOcrsx5OIitoks7l7qtjs7fHnVkAQGfEKNga2Uq19k9+NLNWuIz+nd6O7gCYN6mtBq5mXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333298; c=relaxed/simple;
	bh=6S2SgvezqyhABsae8XaEo3jxLGIxyVwk8lMJAuwNXbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UABP68X9gjyFGU9hcmjKlk+uu0hAck9p7Hndn5EovdC4OzKmg2DB8IU2o7+UZY7t2RDTXv8iobHgRQxspybsUq2Ei3v45IUOP60kBgCex05hjkqwsWXPxSV+11T+yjuR09E1/p/kjVdYcioOzNdAQ8bJdHZXCMALvTBzkRNavyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tez11U9N; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tez11U9N"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c12620ed112so383792466b.3
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 03:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783333295; x=1783938095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0UD0HPClBBvfFssPeNFF6X+teF7h23w+B5z9TKSsVY8=;
        b=Tez11U9NL8HXVswVPhA0+GXvfmqYQquQxZx/SN6yhub7TZE9oXfJ5z8kyKlvF+fLZf
         m/u6s8oYaZT2FC9QhV47GD62KirlnXY7GiMeYwTY/UKBQ5x7gC+3n8v35nyw1y5FV+nL
         sY5ejvxNL4vi+5Qv9rTMQ5wTE8TtOyCLJ1NrBqJDV+8r6QYGcm5UEiCNxoERFwk0JTs0
         1swFoFPZyrYbdiV2lXFTIS3cOik9z80vilbq/Ch8IBgQB6mrFfy3NmQfxY8PZ+0jwAde
         NmLF4mUvsv39qgqtp4YKeSqaASN/nhRwY3c/bpo48dYmas7GCkdqnav699NqSb+Af87Z
         xkug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333295; x=1783938095;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0UD0HPClBBvfFssPeNFF6X+teF7h23w+B5z9TKSsVY8=;
        b=ZigdbkJVsf2SNLJXKXv+f6nemB7GOB4Rb9CiNAkPvHTSkl/d0eNv+eLFOvRopktQ7z
         hVi1J6RKfEDzHtfSdnoVy3iGNPpuW1JPV/iMLbd3jQHVG2jSz6mW/q10LHx2GqbdcFDL
         CeVakG3aOcJ9Hz0NMGpWra+UoAer+pA8J0gD2OYb2cfOId4407aj2h8xcp6kq87BpkVw
         AqTaTeIvJG0nxfaajb+oglu/YwVYGvcLun1eO8uzbS5Rosqk0hNkew+Gh3rSPDeh5314
         MUzYzFrNsPdYmwPYUdLVmZWKZdSfvjzGnccAtCuldd4zqofxOnfcp9zChQdD+f1P71r8
         pK2A==
X-Forwarded-Encrypted: i=1; AHgh+RryaQTQvXcYDl6iAzl0LJUkvGxA/H66UwgaOvt0jNqlOgp63y2e/rfFfptkzU1uMS5WbFStHrVJ+edj/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBVe7Qsasz4eQwR+4DUYwpNR9Apy6QpswJC9/a8TFlzsk14aJa
	A66/Ui1eMwvtiA6rz3LjjgjqvJJCFx2eeF8tVAfgNSeHSp6ik9Pewff8bDqNlsJAjLM=
X-Gm-Gg: AfdE7ckT37IX35pm01br/Qp3FAnLCVfL13TBJsUmb4Y+Ds+DcgUSMNIrY1wR/bWgd22
	/WeE+Az0sGKBl7w6YnhK0SuVRw1Zn9/Q5CXgLY0iVPcKkMmmJDxIDLEswSTtBSUpb2/t8WzEddt
	ZeU/gWIrCarDmFLMpjhWaZtTHIhUuAUdRRZwkF2iXLbOGFKlqGbEMisXMmjuZsGKyXL86NQds7E
	wu2XvmHkhFUeT4d1GZmKTCJSaCcTjwuabxSB/fds0pfybwTBevn6dIZI0JImT5KurqSuhx3V0As
	vjPOQQ2Jj6lcEzWqT27pmR5BaWDtB7yL0tygJkscIPZlV6azTBcOVHrwb8BBpLRPcsCUSDlS8N6
	hn0YIFhZaR9cYiXt6mcd4IVWfpmDMhukEU0d40bi1fJoGLxv2KwaHvPV0DFmOFshw6fIRR9nn3J
	bJ6V/oM9uxZTEo7FNBZv05Bp+nhA==
X-Received: by 2002:a17:907:9349:b0:c12:951a:48f1 with SMTP id a640c23a62f3a-c12e694c9bemr307424166b.22.1783333295018;
        Mon, 06 Jul 2026 03:21:35 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60f5ed2sm711731566b.28.2026.07.06.03.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:21:34 -0700 (PDT)
Message-ID: <f5665b0c-bf9c-4937-a0fa-2b245e8093f4@linaro.org>
Date: Mon, 6 Jul 2026 11:21:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org
Cc: vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2026 08:11, Atanas Filipov wrote:
> +------------+-----------------------------+-------------------+
> | Resolution |    HW v4l2jpegenc (q100)    | SW jpegenc (q100) |
> |            | Execution | avrFPS | maxFPS | Execution |  FPS  |
> +------------+-----------+--------+--------+-----------+-------+
> |   512x512  | 2.2332    | 1139.1 | 1195.4 | 7.1055    | 358.0 |
> |  1280x720  | 1.7300    |  418.5 |  457.2 | 5.0585    | 143.1 |
> | 1024x1024  | 1.6991    |  374.3 |  397.4 | 4.7304    | 134.4 |
> | 1920x1088  | 1.6596    |  192.8 |  193.8 | 3.7913    |  84.4 |
> | 2048x2048  | 1.7277    |   92.0 |   91.6 | 3.6343    |  43.7 |
> | 4096x4096  | 1.5887    |   25.2 |   25.3 | 4.2163    |   9.5 |
> | 8192x8192  | 1.3104    |    7.6 |    8.0 | 2.9987    |   3.3 |
> +------------+-----------+--------+--------+-----------+-------+

Nice thank you this will really help me verify/test your work.

---
bod
