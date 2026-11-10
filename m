Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354378;
	b=VvZ+bNe2CNMcqfHANoctdqDBOP+4VRKOD944/OeOLmGGCO2jSKWgtD8l64stf+/Djre9
	 0fzzXwHwVVhF7jqWQyAwr6iRvKTiDPYF7LAd8cQvjaXKhbdo9xOfF1+8aux0RlzjQMOEh
	 ioSbNivDLCMdCV1Rrcqfgn/nVz5/pZBGKuQg1vEqtsy2gwij6NwMwb8sApqYBadOanD8m
	 GG1MFz+u3qaLCaAqsGcoguWh39J7KehutDoJvEypXxxVKYwxeyLMOUMhYemW3PnK7j5Sc
	 PcSDEGmxHSQ8lGbHsexK3mPRkbtfa2PQEu56BsczJevBD1AK7M8ixSva4dqYtWnzU9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354378;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WCdKUUEAMgyuIUvweS/CVZqWS7quwtCy3Zzak2dFXXY=;
	b=Uaj8ktt/5Jc4azU/jgZqrJ7D0a+PPPEtyADr32Ploe0ybbVxcpJ+d7HL1t/ubpFeFvt7
	 Ncs9Kdc2xGUIshrLA5KVQtisYmVMfLtvdSgrzvGsxMltj0AXQrEbNwZ3DZNmzMVIPVmi6
	 UAutCyde6jv0ZCpkETTUMWAZwWltBZPiaKS7RSGO9BD8qNjYpSXcjTNCiUqxgleBZoRf7
	 +CGVT2yyGKpHImhkj9aCyW2SAPNK+3kjBZrQPBPHGmYTuMLmNtB0FjZSwqCdg03G69oEu
	 l6tnbnrfki72rqcJeDgAeryiOXNLpwH0Wk8YwbDz90Mhc0ag07fDfCPH+8Ar4OUMRSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99053606A321
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 23:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99053606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b305312e4fso22724397b3.2
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 15:46:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354376; x=1794959176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCdKUUEAMgyuIUvweS/CVZqWS7quwtCy3Zzak2dFXXY=;
        b=m+ksnV4jTDix2Dyj2XNul9x3fYZ8LgT3/8KE4pkLM7OaUjJlmGwmOkrnRiH+4L2HVi
         QKmPMXEed+TT8QCweF70kIv6Nl+bUi6TvTw/q6lky3YIP+HxTZ+SjkbgfNspSEU3Qpa4
         oU/HQMbPyXxNHyOjgih90KyBW7LK6HLengsLfoZJu/YWDUonqa7kqtoH1s6mqLrk30Dy
         6yRg3Qp9A8T9FaXBGaT9V1YOCRWRyXhEVCAvuKA+aZOgYNPDFGfX8uk8sQyMgGM+x9Nf
         Ftax6oD/7d57dec6vbk4mi6NZxx6SQ3SQ7Lt+tW4Ig42BDuGlr4PUezYbGTF26sEwFi4
         SbqQ==
X-Forwarded-Encrypted: i=1; AL+hErF04sQUrj3yBBLvKp8pGESxYtt7+OP3YnjyBk4QO3ytbySlf2Sk03LaY8ex1O5m5hU1iGEt5QLOqY19pw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+MUWOVJ44JYOkwjUBuYTTfI1gnQnZioIa3x0GZH/LmJMPFiM7h
	fMcriJo4+vm8gWYbOj0/6ImPLOH6xiyGErh3sFNttnHdvMdwwhBgD21S
X-Gm-Gg: AYBFou3+F+kKXJB3LRSeoKSOL5ZUXdlKhd1Pw9ObCGp0Y+KIUTly0DNxCQd8cy9VxIA
	UJLRd/crHg0kZPNQtW4n/gYhnej2eeW+8YlIRVsE5lVbqzM93ofzu5AAdcT6/8SyGUfalq2StTJ
	rY/tP3aWoECyDBBfrccx70fCYcGNuySxa4hustuBpNZ5ucIxtjnWcLVQRIHXMF/aW37nRQiOz+V
	XpizqwcfHgMABp4e+yxVSQRmx3oQyKzsw3eXwFtn2DgGzMHj2N11a+leI7poNWPifxez0DbpQ7P
	tPYX5qpssg5FD26tcgXqTvfk+LLlGlD7Oa7Ut4QqtRAb6TSV9nOWE3ynmRNDbTJ24EKtgO/RVQc
	lZMV3uMuzF+2YVurUkF2t2DnKesk8p22jCdBZL9CSLFq9+vf+xTODWZEcxMqvo7x8d2GJU1L8Pz
	BLVevzChZ5twqcegzMMpqnd5f/vGN5RbFj6hu2/+yrVmKQf5XOdZ3fzcIr0/dWMLSfMwhZKTePS
	OmdbwWz8sIHBeIySdEwLXp9NCZnIqScUc4ZzRAoBPIrWrGll8jVwaJK2yPWCMPgbjUxNY/ZoK7h
	5zCEAN8UKMgxJizaGksAhNWaYtvQcgX+q83DdwEILN7mm5QWtBNcV+YdCpHyDKN3ctIzdfB0
X-Received: by 2002:a05:690c:e3ea:b0:8b3:15c2:24a6 with SMTP id 00721157ae682-8b3a7ff3419mr7031107b3.17.1794354376630;
        Tue, 10 Nov 2026 15:46:16 -0800 (PST)
Received: from ?IPV6:2800:a4:806:ef00:2f77:7097:372d:6d14? ([2800:a4:806:ef00:2f77:7097:372d:6d14])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933c59cfsm31871827b3.17.2026.11.10.15.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 15:46:16 -0800 (PST)
Message-ID: <ab79818e-4b4c-4b58-bd2f-57d9ae4cddc3@andrewgigena.dev>
Date: Tue, 10 Nov 2026 23:46:06 +0000
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
Subject: Re: [PATCH v3 2/7] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-2-0103e8a0bbcd@andrewgigena.dev>
 <21be3761-9da9-48c6-aaa1-b56f8625167a@linaro.org>
Content-Language: en-US
From: Andrew Gigena <mail@andrewgigena.dev>
In-Reply-To: <21be3761-9da9-48c6-aaa1-b56f8625167a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Vladimir,

> That's an intermix of names, and you will get a review comment from
> Krzysztof about it, I stand aside.
>
> Here too.

Krzysztof did comment. I kept the vfe0/csid0/vfe1/csid1 order from
sc8280xp-camss.yaml in reg-names and interrupt-names, and asked him if
he prefers another grouping.

> Drop 'gcc_axi_sf'.

Downstream sm8150-camera.dtsi feeds GCC_CAMERA_SF_AXI_CLK to CPAS and
x1e80100-camss.yaml has gcc_axi_sf, so it is used. Can you explain why it
should go?

> Drop 'cam_' prefix and 'cam_sf_0_mnoc' also.

Prefix dropped. I kept sf_0_mnoc because SM8150 has a CAMNOC SF path.
Should I remove it too?

> Or C-PHY, right?..
> In fact you shall drop bus-type from here, because the link between
> CAMSS and PHY's output is not a CSI-2 bus, it makes it inapplicable.

Agreed, bus-type is gone from the CAMSS ports. It only exists on the PHY
sensor input now.

Best regards,
Andrew
