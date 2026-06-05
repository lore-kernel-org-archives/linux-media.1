Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037EE47D94B
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 08:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649418; cv=none; b=QuHN4BMM35znQuSgk/mEXLI/JsmbPS3CovbpY7k2KNlmVVhMCRv4eta7BWrhq+x+HIPGsIgjfUp9kdd2Y8j6L0FFJxCRriiNMOxujLi9RBBIudMY0wCSlkQQbvYEzHC2XiZSCOAl3Pe8AnjNZHLrycSP7wwX+i8+rqwoaYHJS6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649418; c=relaxed/simple;
	bh=oiRMhyrxK1V2pzVWG4kwnbDDdDHtak7KOQmTPXZkRPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQdCetXRa4PaC4Ue3WoFb9zFYCGJHJEtJcOrzhMxYCLF9nwq4GZ1mL1JiE256nzmMNOm6Fon8zlGS6vax0bL5Gu9mURTTwvU5mYpqP6/7rM77Zmos+pA5NCeFP6PJOJy2VZCC21e+jVXzcHdcOw/R5+ANLKt0+i+ajZVmwIAMqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eOegX9iR; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eOegX9iR"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-68ad1e513d3so2437569a12.0
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2026 01:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780649415; x=1781254215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BZl60tcPzHqp6fX1KDjQJ9/5UBp9fAzatRkPhgk+Y04=;
        b=eOegX9iRXSYRza0VjOMOoGMs9D7De2Acg9J9qjTS8jA0cNET2ICEXXyeCiPfa9v2+t
         g5mvGd/cyDes0BB0+Vusj3uK1tb24BvO2TWiJRYIzbKbGl4YTRefWi67YvrFoNhAVWbi
         geU19o1fsC1+gLLP9PEe8LOx5RQF7qVr+npMcLRjKpFasrnqZrUzpehJTGMW6CdursSY
         6RHQqspG5i3KEqzB+3YRdjssH3vtQZHtdOkzQp0fnfdNtR3z1cGA9QK5Cg0s97dlw6n+
         POKnPa+GIbFBq6YT+jM9IXqfzLBTWK5/WnaPNpms9SSRKjoweiGvg2bmOSb8YKiC9NL+
         tEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780649415; x=1781254215;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZl60tcPzHqp6fX1KDjQJ9/5UBp9fAzatRkPhgk+Y04=;
        b=UbwU8qWNk7R6e96xgVfuyh2l6mSAiOj4bmi77PI9kNgHEYA/KdDXtH9Lihr8FFNNTv
         t+Tdd7zezN+cHT30TBbhpjLZFOmcA9AmRhnBbp2qGCNs2HM2k778Rw0ssdbnMNRbgQxa
         PnxPkzjbmtQHroosDFc2uv6Qkqzigl3N3ZI/xIvoo6sGrOIMpgYN0ClyDMCCucCNZPOW
         hmzn16vrBDc9RQ5Pae5U5XOdkdqjDdM/DJdW8l+jZC28WyAWwFQprw7BdXCij/ouMAfA
         TuXJJs9Cf9L20aakuqGNhLrU70Zx86rfrBA8Rl7eA/723TZQGFi9K+2Eq5bTb6Xn6w0S
         1ZFg==
X-Forwarded-Encrypted: i=1; AFNElJ+RkeYbrs2DYXXyEGM7sRhWmsQfzWk/vH8GFrd+IE4reZxKBA6T1+czMwQBvdUCaaX1y0Qv+eAXoIpdaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFzkhN7gPdO3XFWSldyL5adxPeL2WxxEusUam5jiNr91HLsVOt
	d7uKDhH6mOum3kvyS5FMSt4Y0jqyHqq1uTTW7huKKsJbiCT+5YLPFI7BNus9oxbd7XY=
X-Gm-Gg: Acq92OFk03b8KhZWftKp6ET02vWAqbtgjZFfXnjMnD53Pe7Mc5075ik1En0qIa/PSWQ
	WaCC2Ut/3sgbuxdp9RRviLTnyOFf2FBzkpqI31mKiKqQXQFtuLCkcCvlNMR0CU4xWZ9mlahb1pe
	qQhGaHVB7Qr9ukRJL07k1SqU11ki+8iqeM7eZ64Vk1NrMVeKFca5/QUxQtPxdk2pFlsbwYhOK1s
	XX9QdUoe9q9S6USIpU3av1SXmNbxn8AgshCwDO7IYeaMCuH3i1S80WGdfSuDRhmNHRyyDQ7rOGU
	PTWg9lnZ0YNHIqEdRR19J3zyNm0kMzLRyK9TpKiXb5edjHk3KLvIvmlg9MQArRAr9inu1oMgHs4
	bf3HzjscVh5ug5Y1B6B1KPlLKl0Cp3Ck+6/cCUHaluVQgr6LOzj5F7ItkTfOYtdTfMRREj4bq1h
	6OaFbHxGzLVripaShvSnihW+LdIegny1+iN0WqypoSW+jgfw==
X-Received: by 2002:a05:6402:4595:b0:67f:99d8:868 with SMTP id 4fb4d7f45d1cf-68fa5147360mr1211380a12.16.1780649415420;
        Fri, 05 Jun 2026 01:50:15 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.11.158])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65867e67sm3320961a12.21.2026.06.05.01.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 01:50:15 -0700 (PDT)
Message-ID: <43395467-42e8-4737-ba5d-23e31b5518eb@linaro.org>
Date: Fri, 5 Jun 2026 09:50:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] media: qcom: camss: Prepare CSID for C-PHY support
To: Frank Li <Frank.li@nxp.com>, David Heidelberg <david@ixit.cz>
Cc: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
 <20260603-qcom-cphy-v6-3-e50de0b557a8@ixit.cz>
 <aiChDyKleAYuzjMg@lizhi-Precision-Tower-5810>
 <43b7da84-3390-4094-a61f-9e887660eb10@ixit.cz>
 <aiHM94-IDjiJWeqe@lizhi-Precision-Tower-5810>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <aiHM94-IDjiJWeqe@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2026 20:07, Frank Li wrote:
>> -       bool cphy;
>> +       enum csid_phy_sel phy_sel;
>>   };
>>
>> Frank, Bryan, snds good?
> good for me
> 
> Frank

I think I've been fairly consistent in asking for this to be !bool so 
yeah, ACK.

---
bod
