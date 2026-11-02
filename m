Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624316;
	b=28fLSon4W/e9mUf1Ozh5adorHgdR9FgUVu82O62Y+pYwGXNQCRoRekWBY2icO0AFEGMg
	 qzMltyfNPD8SpRVtCX10aolJ66NwOXSwVuS/FmaDQlYsKIQEMtFFNr1sD5uWPve4ShmaJ
	 Uveb525pOU5K9yzAXAslTqAn9NzT11H29zgiu6vMH2WDPK9bPdgHReOuV4UDlCpxfnZ/Z
	 3yh/Jvzyt1D709OOs8zLE/oVMuY1HovTgRORQTTL/ttM/tAlUPj/gtClTSwA2px54fBs2
	 LEuJyPh/5FWKtAfCwaNcFxqBYwdcutFr/HFxdpaHWXPpe3RGBDndBu0QL2szeQs4LDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=LfM4uAledb3ebU9yvjdbYO/mTumVwk76mc2SnxdRhO0=;
	b=d97fsR0pJ0c0f4G/YfOkoW7GhtSC0Ji5RJ571WoIvMq0S6sbvMwKilvystkaSRbJjFH6
	 bCbiOrIuCME5J0PeMWV3tJY2haDutbNi8d6xfedaQPEka8ydXZ+SlX7+IA2ETcp99KXkt
	 SxDOgpw5+9uo4sZIAitYqEpMwGJa1DZLx7HpBVPSN7hlZjB+fPM4IhxKjiV5WDE+Ee6Wf
	 O+hss4mlb3xYTWYZjSXBYQOHeUv9NCRFrADisV0mST8XQT5L3tdmpRzEMwZwr1vTo6r36
	 PwdoShP/7V4ehiySKoyk4y2zVfgygS2wB03J21VVeVoC9cMEJazFc4bb7wQFgTui9jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sgANBLTL;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68F1606A339
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 12:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C68F1606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sgANBLTL
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c315869241fso414635866b.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 04:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793624314; x=1794229114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LfM4uAledb3ebU9yvjdbYO/mTumVwk76mc2SnxdRhO0=;
        b=sgANBLTL4YAZDwMklFM2H02NJCcXk/PdaEgxBT2cdhpFkCoMZ6HxQPXwP3Z2b/DFeS
         wBWKIQCNz2vp3MFn2A9bfGLKJ+KfLCGxipZu5An6Be8/ZVkEo19A/rATSys6diqxaHtx
         J07c97i7fSaKZ2780Unuy3tmV4cGWFeFHLzoWzX4v2isazoe57QuT9koARmMIfnAKsIg
         vRgOeAcNKiSUpqC8uifA0GnafMX42orf2CX0h/BEp8yZMiZlT9lmRhupAQC5noRBEu2H
         IjpvebFG0o6EmmhdW3s2jUXkFps/v3WUdE7w11o9r1todRotUMvA0pTU2vV/s7A53Br4
         03sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624314; x=1794229114;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfM4uAledb3ebU9yvjdbYO/mTumVwk76mc2SnxdRhO0=;
        b=Oc+nAyUI7GeMhs89/rpyYacLSMq4TVlmzw01XIHWM9M9MvOvjTumAwxw4wJ8rGUfK4
         whvKbfl9QSuL0vREQu1D0P58AadYAG8DElHd8PMFroIwv9/mLVdWn4u52tbol5Zs3DL7
         Z4yq/koFOo400LV6xB/jwP4avKGX6JBreW6+pECEfvbGUIDzD/A0yK99jmGYgcfyX0QV
         J6/2Y4UVgILPrLtIOh701HrFdZ2QIml7Aw3ZV3nVwUUj+0slhTo6kgb/CL5mTDgpycFK
         327vcRtzJ2kImkzu9eHpLLuYzV2m+7dpTVzonB/CzM7GOs58p4lUZw3NnPQaqG+fT2KE
         UZHA==
X-Forwarded-Encrypted: i=1; AKwUvBx35W+9flZxlkUI3wWZKNH4o4SYQF9Ofuttt30sqFEC+8kTSVSq+Zcb25EyQia3TA6+i4f+FK5sHF0vnA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8SVkHOAEmeOf/P8/dN6hl40iOGWiWw8xLdj8K9nmLu0P71oRwS
	tcXaOMSK/OeS9pDHupkGS6fEVqPp1UNE9bw3pNnVe2URcT4EAFBFPCNBSsuVHw8GU/k=
X-Gm-Gg: AYBFou2tj68LXqH1yYidbsxmu7VGT/yWJVFSLP2XOjvkYriSKxBpWXSXzR9EWHavnPG
	2HQAmUWRf6RsRW+KZMsPuJCsXfIAY5cT9mpzY+n968Qx7hE1bkPpIUC+fhzL6At1qpjS3L7SZt5
	09WFEFhCc27FQqIN70JXC0b0uIapm6mE5LnWAT47o1soiRfT3/CQy1NxYbGZ5qsWJ8/SMnrHuqr
	ys98XE7Gx0MhbNxrw8qJlZ+vt7vdsR35NGPivhMtGKxpTAsSynmCjhtLCp3/rmY9CrOy66ei/b0
	w7MVelF1nXWU55I2v3D6FOyxCvi8RpnzieILZv67bZ3GJHhKuI40ggrYKVKIkKVHF46Ww0/vsF/
	qQvISVGJn4TWRBbgg+1Wd/AvNIPyFhIA5py1n6mpyRh9oVs0tHq/17AjUIojJleRnU1voqdM7cC
	on5qMixPQWXDrbg5VCjrWvD5inBqq/4G7c9ad8U4cYlOB3y9zu77ebQqlWZs6SeioFRXN6HkPXU
	t/Fv6elgJ2D59MROvFY7Mhn9ut1TJPIKgb3tfyrHxisT9RadTfaA+zu2UlVzTOgxPdU7cGKaNgF
	DDTGrzEuC4EqHiIVAa+QooBmZySRTisNTbfJ/Q==
X-Received: by 2002:a17:907:7253:b0:c29:6400:ef8e with SMTP id a640c23a62f3a-c4ca7aa5303mr800564266b.42.1793624314046;
        Mon, 02 Nov 2026 04:58:34 -0800 (PST)
Received: from [192.168.0.167] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f376sm3476980a12.26.2026.11.02.04.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:58:33 -0800 (PST)
Message-ID: <fac8cd6d-c3f7-4ed3-b0d4-7cb8a7a6f451@linaro.org>
Date: Mon, 2 Nov 2026 12:58:32 +0000
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
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org>
 <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/10/2026 15:25, Hangxiang Ma wrote:
>> On 30/10/2026 12:43, Nihal Kumar Gupta wrote:
>>> +static const struct camss_subdev_resources csid_res_hawi[] = {
>>> +    /* CSID0 */
>>> +    {
>>> +        .clock = { "csid", "csid_csiphy_rx" },
>>> +        .clock_rate = { { 480000000 },
>>> +                { 480000000 } },
>>> +        .reg = { "csid0" },
>>> +        .interrupt = { "csid0" },
>>> +        .csid = {
>>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>> +            .hw_ops = &csid_ops_1190,
>>> +            .formats = &csid_formats_gen2
>>> +        }
>>
>> This looks strange, why is there only one clock rate ?
>>
>> ---
>> bod
> Hi Bryan, the current CAMSS CSID code always selects the first frequency 
> listed for each clock in the CAMSS resource table.
> 
> In camss-csid.c:
> 
> [...]
> } else if (clock->nfreqs) {
>          clk_set_rate(clock->clk, clock->freq[0]);
> }
> [...]
> 
> For the CSID and CSID_CSIPHY_RX clocks, the hardware supports three 
> clock rates: 200 MHz, 300 MHz, and 480 MHz. If I remember correctly, 
> 200MHz and 300 MHz is not sufficient for the sensor's output pixel rate, 
> so we need to use the highest rate, 480 MHz, to meet the bandwidth 
> requirement. Thanks a lot.
> 
> ---
> Best Regards,
> Hangxiang

We have a series from Antans to address this though.

We should list the clocks the SoC supports not constrain that list for 
one specific sensor on a test-case.

---
bod
