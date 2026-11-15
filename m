Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744454;
	b=lrwumMQZx4tJEERVLAFdPpOA0cqZ4KPF2dUGW37kZbYOU0hBTKqByhnUe5vSiSBdtah4
	 p8SIC3qkJ0duABLmRYVQ0ep4NlBn0zGEZqtavaYiiRyQp8IMbnEnZGdT+N3+JzrKEjw0s
	 k1qjcnzuUiuwQ8u4aE1MBeL7lr0ODe/SLJnE1STeClIKTsqh0yk3ReZRusvTqoivmFS3N
	 Y8IlofzB64TqR0sTlxN2a5EADBqS7Q3Ef1uFamt9Uih2eEBF62LFIDKzCQuJRT8iwClZA
	 Jy7s6KBH++4csqaDeB6el3jXVcH/StNxJYTlf5wbcXImnI+PMKo4UCh6+ZMDD8X5G4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=r6K5yPNLQHHB0Nog8TnybL0n8K+O6sS9uh6jOz0Z75E=;
	b=S3wHhioMcH7dhEOX3kOyz657t3Pno+sChyNr9uQRRRSvtklab6Kc2ZtAx7fO/3d2ZJJ2
	 i/kG6q4/D5sy7dstZNwNRdAl4/Bqk0NSBlCYzggiDAeyUxdMHh2QSFXBYjJ+IYUWot1cV
	 zTwYpao4LMWfgbPj28cuY9FOonPoKAjtwlLi5EjPw89ywyM5FUO3irRatOJ2gbg2kjHQA
	 7HKPmDgxMjIM3x/5h6X9kdXC1QVZI2qNEo9eGIUd1rsp/lX/+DmaBgz4WZ4DM6brV6jmz
	 x9f2aynf6wAMDS2wbiYloLkL3EqCOmqyhOhYLlJNho2935GArcwh5aSIPMZvHvaKSkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ivnCHnZa;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C020606A32E
	for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 12:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C020606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ivnCHnZa
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso18147415e9.1
        for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 04:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794744453; x=1795349253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r6K5yPNLQHHB0Nog8TnybL0n8K+O6sS9uh6jOz0Z75E=;
        b=ivnCHnZaftDoBq4Gu8kkVFXEzJgGlSRM+LgtFJVDlwfFAb/n3HudZkR736adgQgnJo
         ytYa2blxe4Py/DJASfqDUlFkMCck4XodHVmszliN+mxK1P1sXE5p+NVwnf90ghioz0ct
         5X45X8tkFPDaTUmpOO3RLQ1RZTBvOCS93yaN2xwsw5751TvRzY4y2XhuaPT1zW9IvuIJ
         cLviT9GDTLT5Yr6iPOmFHAScweTYW3K4zm3ouhq1mL9m9vmuznAgU499um/26kIZJLdo
         OvYCeppsIzJ7QBnAVNOfhlt8PxTcbnxf5+SWgLmRGkm26V3e7O2aqmyGCum+rO8SW1A+
         k7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794744453; x=1795349253;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6K5yPNLQHHB0Nog8TnybL0n8K+O6sS9uh6jOz0Z75E=;
        b=TR9GPf9yLPE13IbpamYZ4vqO9dRNwUYaMJSjm6Ay+P8miiVndiuoML3fGVQ2SkZGKg
         VUZVV9cCKy3ibrBjqGCXPRZYm133oZslKQpmjB0Pm4rFrOiw5AJm0SEctXaBfWAtgQG5
         X84Mv2EiaP4x97GZaOI5sUfThu0uRZaKaV94+3GFC9C96gkxkXbSfq530iNw8omtJiN3
         IQjb7D5Ry2PZSoisLdvwziJJxWxSYmn/juPaf9mBadlPdBkB2Owrjg6TpPI+gWZ1K46c
         MflBheta4p45rzkFrtShB6+RpIfpI+BQ0B6u90J9Q+pcfiaDs0G7V2/mkJmaCpXOX5bf
         CGCw==
X-Forwarded-Encrypted: i=1; AL+hErHivnH9rL6byDMQUjn+9McmtMtYLDDNyb7YhkMzC4pDrCyNczNRuoDsugKAR0TxXOzjXnrt3o8t0MGE5w==@vger.kernel.org
X-Gm-Message-State: APuU4Z82AOYbMMZd6PtxEYui0I/Vx34z6gC4hUWXFH0OlDfzykuZBljM
	BGqC+Wnc32av7HCtuU0DfA+w7Mm1GcAuIP4hQ1uDjO+HjoGrXUJpjSiBKejCsrsGIi4=
X-Gm-Gg: AYBFou0SrKi6CTZQ/NRS395BzTdoZS4Mnx81z0ZvANmKpAeHk2ZBm7CdxCN2CKgc/0R
	SgRALkh6HZzEYGYNfCjvZ1BslEhSAIPWN7TQdkoP2W5Pb881DUJCvux+ubAeDzxCcBH/b5sjYpB
	pvKeVfamZ1QcS1777wkr7CwBzouOY68ZUgG+te77m27XZqqoGVZDo9m6xjWrPSX1NSQ6Ramr6es
	rvVe8oV8vONDIAVY9mYThctbC4QDvPclhKrRjKvBkwPEuk+F58TKCHUw/U+T9WMKgAdVLmLuUB1
	MNE0oUjXXNWd5hQlirvWMs0IKOYQ4JoJbXCp2jRJNxJ50F94i4++k3373hb2k44X4cYySPX3Udo
	X8AIgn+qRk5lBe+Wp4Ks0Iy68EyPMBVT9RISr/F5HTCuOEuuBu79FFn/DfVyg2zBKyspJpknBDv
	SeCsZYuvfctIaAmizjxqWjhhBnbYSCRaq2UQ5Io6EXjsoAZPeQti5LtATnWeR/0lcM30EqZxVEv
	aAmMpmfMPZch5Dl3mtUilcJ6M6ds7Z64Cxi2ZSc7Y5SKJcsRhVpjqeKCMAupnKNc2MCrHtimz0s
	KenwmPdQbRJk5Ly+V0j7ndvBIS3ST9dGehuz7K0F2EhOKda9bhu0ZDCI/7RGdXN5
X-Received: by 2002:a05:600c:3d92:b0:4bb:6c01:de81 with SMTP id 5b1f17b1804b1-4bb6c01e02fmr25950745e9.19.1794744452736;
        Sun, 15 Nov 2026 04:07:32 -0800 (PST)
Received: from [192.168.0.167] ([78.152.238.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm189440575e9.4.2026.11.15.04.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 04:07:32 -0800 (PST)
Message-ID: <d4fcf0ac-571e-4d3e-ada6-a732d68dc18c@linaro.org>
Date: Sun, 15 Nov 2026 12:07:31 +0000
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
Subject: Re: [PATCH v7 17/23] arm64: dts: qcom: sm8750-qrd: Enable S5KJN1
 camera sensor
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
 <20261114-add-support-for-camss-on-sm8750-v7-17-8ff2a11835f6@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-17-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2026 11:29, Wenmeng Liu wrote:
> Enable CAMSS, CCI1 and CSIPHY3 on the SM8750 QRD board. The S5KJN1
> camera sensor is connected to CCI1 I2C bus 0, uses MCLK3 at 24 MHz and
> connects to CSIPHY3 over a 4-lane D-PHY link.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
