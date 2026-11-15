Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744306;
	b=y+WdtaWKOpSlOoyIJcs7VsBW2LrZhGPIb18qMH+hvrEoYdpRoIj/2H8F+zsQOtZTgI0I
	 GHOWBDEfhuYoz4hoT4RfYHwaOd5j98tv76h/3jdcCOgC+gBkVjUqcNNuy5xPkyfF++5MC
	 OVbQ6NRbHWe2EPARMyPRU2w4P3ZSBQDmBqUmeRU2Evj0HeqQNW9ONDfwek0BlR8jrc57E
	 lE7JPFpYh9w627YJCZs7KUll3YvdLpnnRugtzWGUuffDnyVVVRrirbNKsX4gGqokCxoDN
	 8ogWpQfL/mvUVxJrI4QMXLtSs0Ct++xCcI6dQeXfN34gYIRO2oiml5j9On0z87+UQyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ZX7ZEhQfl7zn0ja70UCAxY+bTQCiZDULfmlHtdn9utU=;
	b=bBtEQ799RVOoH7H8ozCI7kkaobpFl3cr4P7DIs3P0gCejNL1QBnFcEMHJ1JpE2vkwf09
	 jq01de7FMdLgN/MXdpGjUG1EeY6nWEfBrGg3MpnF5xo4sAGUjEigskeKfAfc7lyg8JTNv
	 3fbsp41vyi/jfw5Hb8MKEAKq4uSUr4UUDe4JnjjSFGTZ/S0aOH3jCdrnXpxDX6XG73fk9
	 0aXKTUo2xi0utYgLzOqq1b8+ERefxaNsCWJnG6eR2MFZWRYg980lGg1TxjKBo8d+goyEz
	 OdxqtaFqvOhe9YNP0clQzIgrtGBvySNtk5FrvaPpPFhH181D6UxxxBx1+gleQOzmiOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BWNNjBki;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BCE606A31E
	for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 12:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6BCE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BWNNjBki
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso29006605e9.1
        for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 04:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794744304; x=1795349104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZX7ZEhQfl7zn0ja70UCAxY+bTQCiZDULfmlHtdn9utU=;
        b=BWNNjBkib8an+oyBZyJADhDa56gBBq04KQvE0jWVFpSJfKxpF4gKrAJaqtGgQ9A7Sk
         ojS6OtMdXCNiENKdce+QVKFflf9mEeRXGuwOfIUJ6ge95F2lMlClOFtMNlc4TMSPM0J8
         OV2FXRdUFoZjdPN3arL5fxZOttuMPOroAyZZOBC7Ur5ZUcnxq1huRbmcstdqw1kgjnAr
         p0ABZijR6NLOhZ2WnekX3RIVDKxp+9ngiyZWFPwfZXDz4vy9t+jSaKtI1nNue4l72DDh
         cQtlj1JRMaanxpySB0K8/6m66GzX8SQjTDawrPFHoWZ3u1MpjINNtwJRoQM1ToXyNUfW
         1a4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794744304; x=1795349104;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZX7ZEhQfl7zn0ja70UCAxY+bTQCiZDULfmlHtdn9utU=;
        b=mmtWIJlqs/hXPqCMCevRTQYv3I+ZXAjis8emDaFn6lj2uU/o1lGT2/MZKX+uExBYn9
         YY4F0+jo/oY+fpTwQxWhndUV8ECIoWdXUQLZxclbAG/k9YFKpIqhV8suegaAcBuxV8fG
         80CX3ViNgv9UBb+vI7rtzdFVcDZeiw6jhRY3FGBNf+V4G8KqQwWDESINzV5vNoa2JD3L
         9omEiSao9VxQuxu7aaYBTbtTx8ENz/H3KhcCp6187LtnrjxYWEcYICbfEmUqzOJbDmLl
         WQfdzQXMeq9UC4uRBD625es7JWfabhh9++ePDqHjSCs4vA8W+G14TaDAAZ+/Dh+HDaDm
         v+VQ==
X-Forwarded-Encrypted: i=1; AL+hErFlSPUU7E7/2n1SG4semv+FzdXNiPsqvvYSxqJzDC5HsQr77Czr8jpM7qLqkxVxea6/+hYys7i1r3jpQg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8NezoiO8azQUXAtFu65lT0uq2JWa+Kgpnpryd3GaZjmpU3GFLF
	a9SSvwtBjZAbfJrbyIeKKtkyzyE1G9NLxiyQJKxolxGd70/9o97evgLQ/aq9UAe+uu8=
X-Gm-Gg: AYBFou0nLtPPoGa5Zd3lkoxCHTeVIP0z0Is4Z2eWnZYFPd0xDrEoISkXtg2M6XLmFce
	nqQxj2zwbsFeYZUr1BqekewEXriMcqU3BDAsQ/lkb+zfm8sowqwolNmzb3W4fCaVpJnGVxucFXU
	seSTwzhZcNqyMWWjbl2VzQVyu+Iw3m+dtJM/DoY5Z6CdAqGSu4jae3ZiXOD9aFYehU63K+C75Tv
	frjSgsRw1yStRFYpFJpQPECekmBLlmEz/598TdmQduIn4M4szAHm3agm5MLQMYyFgfsXb5CIRww
	5at+2ynodUkAo+HFxLYqiQpWoUMMINTAVtySMmio3e7N984QhCQx4oTfZKQk+vG7FQpmhO9QazV
	DhBd1WiYXQnal4+piSTNFKGtdQ4Auk5cDy8WkjiSicijGEicwKm9T1S43rY7pHxj3CXQy8t5Epy
	T2+7dLo28Nfrjp8+5aZOEJjG3IaXDwFYZEppOLErBr8JtfhWkpawaeMfPZZfZjJQnm6KcHdS1ht
	l01GV6Uv15w+FW5ouxoxAMMpcDynYikBRIzi6AyC6yovUGdykEtsvKS3j8i7k58+9Ci//oje9YG
	f3PyKfInA4SR5hOm2TQcaI7m2i+iCbQka33UH+6UG+k=
X-Received: by 2002:a05:600c:698d:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb5de1f262mr108419295e9.26.1794744304054;
        Sun, 15 Nov 2026 04:05:04 -0800 (PST)
Received: from [192.168.0.167] ([78.152.238.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e33ae5bsm267265565e9.3.2026.11.15.04.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 04:05:03 -0800 (PST)
Message-ID: <a4a3df2a-eb90-427f-8881-f857100779db@linaro.org>
Date: Sun, 15 Nov 2026 12:05:02 +0000
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
Subject: Re: [PATCH v7 01/23] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 SM8750 CSI2 PHY
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-1-8ff2a11835f6@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-1-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2026 11:29, Wenmeng Liu wrote:
> The SM8750 camera subsystem has six CSI2 D-PHY blocks. Describe them
> with a standalone "qcom,sm8750-csi2-phy" compatible, so the CAMSS
> binding can instantiate the CSIPHY nodes as separate phy devices.

C-PHY, D-PHY and combo mode ?

It would be nice to get an accurate description.

> Signed-off-by: Hangxiang Ma<hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Wenmeng Liu<wenmeng.liu@oss.qualcomm.com>

---
bod
