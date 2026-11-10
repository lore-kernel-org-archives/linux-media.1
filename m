Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325402;
	b=xYWo24Hc2L1J/uqy78J3JfvaW69/5Ak6uec+vsjJHJbiOwIRNgjtL7baRXW1ULp4UcFc
	 v3uYAH9XgX44DZogKSY5jZYzv8LU0+Gf0zFgIu07AVp+LZOd9ybXsfVN/RyDI6OJkTlrC
	 w7SvjY7UPo6sx8/N+sSWCwub26f9dx50HvAVHDHLw8YBs6TsZTJL3L1qZSDAGMmoRO8Hr
	 +g6E2nJg5W0yOaJNkDRzQ6UyzdVLRGKysBfZT2b1vSB9k4ebyvDfXUqEzieFMguBA1pLL
	 3/xAytMKE6Ul15GOUQsMmi1gbTmFzjbTBARU4iKCLSH3zz/L/1wQy+Opqc9XT5vV6lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325402;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=TQtG4o/ML/2sB0MvTtvE7H8moOh6q/FDtaR4iqmNY1g=;
	b=CMDlSgTYIEmiqE9fOueHQ7KQU7MGjPjq3uPFMMb6rdHLRpYxkWk16jB1f9J/fZ3vPxOe
	 MobVtAuGV/p8e/ozI72//PjTQeEwv+UudZv4FRuras70z2WFntjQWC7P6IN4UvQunxDXp
	 u2i1dmQ86Q0oYZ+UZOY+VNsYEvM2Hr0sR6/oKHwsNmmt7q4ptfb5WcvqD/AsfXts4VbyT
	 reERJxKq4lYPxlgVFvuPICo7tWOTZynQb57p0Mqp4QOiil+i2cAFQ9124s63cz9SN3Bfv
	 hFJ7aIfiJphuv+0MipwnZCy3jdrrGpBfafESPOD8+suJOd8gKEpNFGWrtUCNgyi6J3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EEF60A260F
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 15:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37EEF60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc751eddf25so1103663a12.3
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 07:43:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794325401; x=1794930201;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TQtG4o/ML/2sB0MvTtvE7H8moOh6q/FDtaR4iqmNY1g=;
        b=fCBgXY9tKNjFjuciSkQBKi8OJJTaUAT4CGqWD58Kv5FPSH5G9AuByJ20/DpM3cikcB
         JfVJs45/R5XQc7etcw/Bxr73a/nEZ3iEJDHj3yMKrlTcjeQDvXHboc9a7bJYBCOMpO6U
         gCMszinP9v2FA6+5w563HljiNLh6D9nlPkoo4IMQROXKe9Y69FoHYD5pVCJJcaebEp2o
         sQWmWsbKr5bN7RqKkrwwLptIMvMduUZggR1MROhvTNLRL6mwjbLr3/DK6mBWlj0FnAB0
         FdsjwleRcpfS/MvrLieTDSMM47c4O5l2+/9gXEvdAGr+KQqtw4GfdDAYPBVh/3JX4W3K
         dJbA==
X-Forwarded-Encrypted: i=1; AL+hErF135FIVv93uFMzTvMjGq8kysXtK3aXK8Jg32CmZfDsYb+r7tI85V8L5DtI86ROGF0bjgXcBNHwsK/HHg==@vger.kernel.org
X-Gm-Message-State: APuU4Z++7yfULwEevVZqXckx9CnTZJyqaPGW748Fh8SY4BUHIP+GBr/Q
	zDzv+VNSAJt3gXdXB7SFSrTLJlJRQk/Pi5ucnfjbv4uX9vOPdj+KlFHX
X-Gm-Gg: AYBFou1G6G4S6iyZDz41UxU10s7f9sESPzpXmKreOF3rwMXaTNzDYajTTiQe5BxF/8D
	yCTTBFEk0NMk9qcvLmwHlhsKDZ0mG4+IuMXqVF6Q2q+3+jZW154/3a3kvGj3sywbKNN+URSzqmq
	QbunUIfCivsZp9zDxquvuJiZsC6/LTvo863443lw6nXL4HIJhG/RnL6FNVbJBV5xaDXDQqQWZxN
	n5QprZLBdVp50HbphkBl95qhozCBmRbDJ1h8E2cCJ3BpBoTRgtoEYMbRDh1L49Zbiu1vYSwEL+M
	d8/ghXmq5fZQnJSURclJ5pgc8eYzQbqXpbo7BcDtuKPEo1uX/szrloNIzWTJMGnMxWZKNdDsPYl
	tBhFxWQIQaLsVRKeGVpoXbZEuTFe+cK7SJaMae5yEe+PNKkkUthaGNhXQg4qN4Hpv0N3jKg3W9L
	95NRt8SsiaOaUN02ybqIkHen81TvDGedE6sa73IcZ4jISaFIa7WuadMszN4CUVwKUI2UPwY9vUk
	yDOTfSfjr8BRMdf74KQC/4JlUIr0XXrK7kHm15uSRO/rvppzG9K5Tn/HNzn6yUkkWtoD7gDBNwO
	SyAzPksZLJcgStFXHwMPP0gD9cbI0GTUtGjFMqJ4eYINGk2FUyCMokXAVhTD6Zxi7cJqnYy8
X-Received: by 2002:a17:90b:288a:b0:3b0:a9de:9886 with SMTP id 98e67ed59e1d1-3b166cc035emr3111438a91.12.1794325401459;
        Tue, 10 Nov 2026 07:43:21 -0800 (PST)
Received: from ?IPV6:2800:a4:890:2c00:14b6:ffbd:f8b2:d9f2? ([2800:a4:890:2c00:14b6:ffbd:f8b2:d9f2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d5e830dsm891469a12.4.2026.11.10.07.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:43:20 -0800 (PST)
Message-ID: <987c1008-d0ab-4508-82a2-1a26104a47c8@andrewgigena.dev>
Date: Tue, 10 Nov 2026 15:43:13 +0000
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
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-2-0103e8a0bbcd@andrewgigena.dev>
 <20261109-slick-transparent-ostrich-28ddad@quoll>
Content-Language: en-US
From: Andrew Gigena <mail@andrewgigena.dev>
In-Reply-To: <20261109-slick-transparent-ostrich-28ddad@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

First of all, apologies for the late reply and for not following your review
advice earlier - that was my mistake, and I should have responded to your v2
comments individually instead of letting them carry over.

I have now gone through your v2 and v3 comments again and addressed most of
them locally in a v4:
- reg/reg-names moved to the top, redundant minItems dropped, property order
  aligned with writing-schema.rst, example cleaned up, ports use
  patternProperties, bus-type dropped from the CAMSS binding, etc.

Regarding your v3 question about the order of reg/reg-names/interrupt-names
(vfe0, csid0, vfe1, csid1, ...): I took it from qcom,sc8280xp-camss.yaml,
which uses the same paired VFE/CSID layout and is the closest reference for
SM8150. The entries are also in ascending register-address order in the SoC DTS.

If you would prefer a different grouping (e.g. all CSIDs then all VFEs, as in
sm8250), I can reorder the binding, DTS and driver resource table. Please let me
know which ordering you prefer. I would like to hear your feedback first so I
can adjust anything needed before sending v4.

Best regards,
Andrew
