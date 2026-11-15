Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744973;
	b=DlnUxqluihwJq+rcvurAAE0YdplY9X4WyIBnMgjfo3s6krJKVDTxIX0kW8gCuYZp11LO
	 q/ATO9Wjd8IOdCe2gS8v+6LCbH27FKpWU6GWwmQ8EjT0tijNzfrht4amsuLoBaa/n8xDM
	 LDbm7rxVpDQ9/YQigssN2NzRT4dLw26OH2oT63k5R9/ZlSb1B5UnghFXcC7v1AbDSZqmn
	 oyG19DYlEPdlpmRt07TnbQyibSye4EumSCECBjdfgBlNI8RqpDS74/5yfuQ288xzu86+3
	 NLI8mujXZibBj2VZM8qU5xT0P2BA0KMuqapdJskFSzRSl05f01ZaSkhn+hxyId+F17w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Cze6EXMazudJouVIRWBezoVb+gMXv48f+e410Dy7G9s=;
	b=Z+uEU7uphSeJ+vLlHsuYc8Bx8iChxw1pT0pfaIGAFP9VwWAEAWB55yspAgB6a4rETgeU
	 2FQfrduL9bGxMtytLLpATpOF4MDWFfMSNBMVTTy/EVPRV2W+EW2aE0ZLEmZtYjNHwziJ1
	 hEHl3s5p1h4fkRgPAjCa55J8RCjvZlJUAySW/Wm2Z7/vNuZNf/ft+iLn0wIUZeUcU7uQK
	 SahG4XKWSKAq6q2YvZFrSZQtLy4FkN1xCOzH70Abn4c6Kfpfn7NaDgyn/jxYXEoAvKBhX
	 riyXALhsZjTmm4qdKMTfwdvRCMyrfTKOZbb51e7MEK1NjFSfaPg4aO2M4HB+3RSDPWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UMWGuZNB;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4E6606A31E
	for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 12:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F4E6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UMWGuZNB
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so28199455e9.2
        for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 04:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794744971; x=1795349771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cze6EXMazudJouVIRWBezoVb+gMXv48f+e410Dy7G9s=;
        b=UMWGuZNBsMnss2pwsw8rRFNOryhk6F4P5MsSQtbTOUSYf7p8ABU3vk4PaN1KFgXJ4m
         sLw57i7wKveAJsqJXa81ii4bayts99u5hg3J+aNyMOI795yl24cB+IpfYz5/HXSDqzz5
         8J81IXNBLkrq8pNuLrlDSWMlsmGEW+JxD6BDFcXHLBQjB+J9eOnH/escoFzz40YDBxpa
         l4K4aqxKU+xhxj/c2gSNDaf+IV7G2FNCNjefQ2qzQHvzhnP9uPM67bTReYKQRNnzW10P
         /U8EwovAUK3sCoJtrorcb/qNryT5hTEQM7Pctt8EMwGpw2KT7wD4z3gD8bIyUjh/OWZF
         nvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794744971; x=1795349771;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cze6EXMazudJouVIRWBezoVb+gMXv48f+e410Dy7G9s=;
        b=ibA7UovkVN+kiPf/kCS+sfCQ6KpStbAQsYrrzwjFENI94+nE1PoMCseaev3pd2k4HX
         xq5mj6w9A+2zHP/sB7aN5mGEXiKT3gZoBktYJEmWntXULwxXM4mKrVliX7GBqUDz0mkk
         Lpk9U0GB/xeCmHQdh6Hz0WCAm/rXkC2FnokAn+7Va6uSc7XD1tVk08zkq4uHCVonp+J8
         C9xZHg4Rt8QsJekCG7ePza0hs37wmB7b7E8wTN6b4+hXLvyua76ou+i+n+5vkzwogVQz
         GJTVNoq5kheDcyxHg1JvbEj/QOg2ldjOmX/cFFEdlBnh8uqNNaUqrmpUT5bNyyXSARIQ
         JOFg==
X-Forwarded-Encrypted: i=1; AL+hErFeY6JhzkOkIDtpcde/AGjqOHQW66lu4snrLYZwqwTZgWwiTvNHLGYPDYvP3F+wXAq1UfTBbPiZrxlwRw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9X1OXgCjTdoYW23SsRcO9UmGvyEeseC+ahsxdB0doPafRu9j4t
	gcug5Rb/wkaPhJtMopkWJfK/fuGAkBgN+sqi6wKFuYpwF8UUcp59xQ7YpHC4wKs1uRA=
X-Gm-Gg: AYBFou3Vl0ZGjU8JnM6d/Vdv0zAsGETVgc+8Ewr71OSE+DVMvzfVs8WxMcXEnhwDWW8
	RcRKhBS92JSTAL8P0F1xrTcBBlPlHD8Ddw/qNrjuFeOE+m4DJGfq273t3pxQf5d1iuyQO3mE4+g
	pgl59xYDRgWw4n9LHC2LOTycvdlUQZFyQuyDvpARzQZzDmFpVUL8fcxnVsufWjGI4Uzy0Nq1iMP
	cNq41AYms+curK3Ei2RiU2S1ftv+qBdjHdFGrQWgigLkDZIr2SbRD35WaOquJCd3mE+whq2CqjY
	fhM9nydpMrnfbFfUGlNrAMRm8G5nF+ONlrC1+R5+nA7De9/uMc8MT+09OlbtfxD4RoHaN7W0d0M
	UFGzFbdlI7ZacNhy8fJ7n47i3L+pVXmQmi1/SNoUkcCbOBcu7LbuSu7ifMUr14m6gKEFKqpNa29
	RAPWMKDn6+GJcy/zkl5acFAdcbQOhzt5CpqBJ/J4lS+DzzO9Mx/X1EJl4A3pJyC8BSgqGJnZPiX
	peMRNWFJNrTVVoCvV6X3FjNbAey7o3HszE3grjN8W/hzFIjcgwwV8z6fJm6fpBOa3ub5+s/iAs2
	Jpr2REL5IuRZcmlIN39DNdstS9Va7YWJSFbUSgC4r6w=
X-Received: by 2002:a05:600c:8b0a:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4bb55a95dbamr161321305e9.31.1794744970969;
        Sun, 15 Nov 2026 04:16:10 -0800 (PST)
Received: from [192.168.0.167] ([78.152.238.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm126726035e9.14.2026.11.15.04.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 04:16:10 -0800 (PST)
Message-ID: <ea2dea8f-e696-4e86-be9f-248cb6ec86b9@linaro.org>
Date: Sun, 15 Nov 2026 12:16:06 +0000
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
Subject: Re: [PATCH v7 10/23] media: qcom: camss: csid: Add support for CSID
 980
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
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-10-8ff2a11835f6@oss.qualcomm.com>
 <130fecb6-5372-44d9-8261-c3ac88248631@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <130fecb6-5372-44d9-8261-c3ac88248631@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/11/2026 12:14, Bryan O'Donoghue wrote:
> On 14/11/2026 11:29, Wenmeng Liu wrote:
>> +            for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++) {
>> +                __csid_addr_update(csid, i);
>> +                __csid_reg_update(csid, i);
>> +            }
> 
> Why does this run twice for the same index ?
> 
> ---
> bod

"run CAMSS_INIT_BUF_COUNT" for the same index ?

You don't increment a buffer index. How can this be logical ?

---
bod
