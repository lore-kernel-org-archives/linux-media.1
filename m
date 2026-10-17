Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E13933B6EF
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 13:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792244132; cv=none; b=fZyHUAtYIhyDE38ZSAxkoHveFDdhp5/dWwQp/w5taG/LnOlcKdR87nRga69uLBO1EBKEydGy9QlDtJKCgmUfqaGYmOkAWp0tDAztjxt9STEVLTnnbHscsf/M+l7rpkLro69Ljhjzl9rSapcF7WAK6f/U2dCWt+fuOY4nMFxzQfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792244132; c=relaxed/simple;
	bh=gBGo24fl5Af6G7SCsbJb5/idqIuEjFcib/+jlSFpkLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ESIPPqrxA0SzLuDT6VIC9YQMykeD5qwJKsxKMhQVoqKFAf7NhhlE/Jqd90qEbKtcYhWU70lJDdWHIoT4IFhP78UquvYEVgR74nWZOQ6SKvz4LeTPDAaMCo78OkcG42kt5sN0N0tkE4xAbv6sbpyIpIEhywpk5MdK/I5MvYQMs40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GzRXa0WX; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GzRXa0WX"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so910215e9.0
        for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 06:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792244129; x=1792848929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bg8gcmVf98z+OPBCGbYb/r+iHjc/oki2rBnkAci8HgU=;
        b=GzRXa0WXUD3So3RP5HtlDhI0t2k2BrlVLbcmaBT4T/kMicK4Hq0KNKkw1KpbEFqbzl
         u0Y4aSogFLrOxRoAwwQUWQp1H78VzBZTIbuJZ+uFdN8XmdYZC/+hHlDxmxmZfEW8rn5f
         +UAxJTwiywIZrRDlw7ufNS5pJLzbvMBocUYd/ac7/qSQQQna9+hljdKc6KQFvQl77w/p
         IjLS5MRnIK30Sl+UNttobQy7bRd5TqKFKMMglUV/6n9CTLLJ7RZGP6zJi1pmhhSAEURE
         FT2EQVzm2V0ktk+O4YqHJ9gaig0K4xX2oFEzDSRaII0j626AEiMeX45m64ZYUvACzKXN
         CKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792244129; x=1792848929;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bg8gcmVf98z+OPBCGbYb/r+iHjc/oki2rBnkAci8HgU=;
        b=IgvIiYX2bX68mX3W+KlJRC7Rh3gD9cl7AzZKE/xmgrMb/zTWSN3Uwdnwb7altZhNKS
         wMYdwEecz9PmkqNIjzmt4WpG+4nIiEcCKViKCfZCFSoyXwc2nw2PxZny1QEhAKTvVJ5F
         I1WxbA67BlXk+gN9HL68nDw7SM1iHETcne8zM/HFmOcMOtQxckhGP4HGptguFZgAGF/z
         +Tplq4tUWQsv/DvIYfviLlWMcrV3Z4o5yk0L+Pl6DVIqvxttIcK33sLPThMz0kML6r56
         VGJDi+bRopHczPUrFmWrvLv2GUELOrZvFixe90/cj4nv2uBMVUrtI6PTL7zy3YxrNGPW
         We6A==
X-Forwarded-Encrypted: i=1; AKwUvBzCG8DmCZtD5xi/KYNbpPHQZU+4bA/fZE5K9THFF88Co7Wq7vNrVDilNAgAsqRHA2vtjxNpFRiQygJiAQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYI0N56FK5lPt2ZfJSfbxfvJKX2OL/K7DLFZgwWdJn93UTqwejMW
	borq+DbYTHqhqrlvJCWvquul2socaZpU3VL0CrwIgEg6YGY59C+jEB/VW9baX6HV6es=
X-Gm-Gg: AYBFou1IREZSoK76jZ21y2U1pt6214WIfHftHcaoLMTpaaLYKvVaAJRdhLVp2Bob5qF
	bmi72YL/6kTozY73PHrqamWi9UUIUvU9ZpK+ErZ5Wll9WpHHTblczrV+scY7aDmYzRMnIxJOcV1
	2kcDYUKUG1Vw1IecNM1t+ITp5bglIjLu1y/aYXc4RGPf5lBEebjPqFvVX9yKJmvNgOX1nHMYQm1
	fhcdQZcRTf+ZiNPtlNo2pyiDI6DuVrGUXboiIVid5+wdrdLPb32vuInLoGMfo/aQ1uETafdMkBX
	8YFmMg5sW88kSqltBrqlb+TmyrB5VvBomGhKkChfQ9jzGTesNwoXRRG/1h7/c1DAhAMY58KVJ5s
	DK0h6zDrw8Q8i8FriPTfcMYlkByHILdkrMPpvIY0a6HUAkAD14a8EDLGJmhm3EOe2Bw07p1PeP3
	gKiYZWbM8NKz+z5i2kcTBSm+6/4LNkdzFSQaXup80gQBiDtV2SsILE+5bwvoGIvIWZwewQDZMNz
	Mh+BKn8qHbr
X-Received: by 2002:a05:600c:3b2a:b0:4a1:d1f7:bf4 with SMTP id 5b1f17b1804b1-4a1d75fcdc6mr63156145e9.12.1792244129542;
        Sat, 17 Oct 2026 06:35:29 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.131.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33155fsm90508865e9.4.2026.10.17.06.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 06:35:28 -0700 (PDT)
Message-ID: <4d307e32-04c1-4df2-b93f-9dd187fa53b5@linaro.org>
Date: Sat, 17 Oct 2026 14:35:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] phy: qcom-mipi-csi2: C-PHY for X1E80100
To: George Neacsu <geocausa@gmail.com>,
 Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 David Heidelberg <david@ixit.cz>, Neil Armstrong
 <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, jigarkumar.zala@oss.qualcomm.com,
 hariram.purushothaman@oss.qualcomm.com
References: <20261016-x1e-cphy-rfc-v3-0-40a346a72153@gmail.com>
 <db2fffdd-634c-4728-a2a6-2ab1816b07ba@oss.qualcomm.com>
 <20261017070443.989736-1-geocausa@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261017070443.989736-1-geocausa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2026 08:04, George Neacsu wrote:
> Bryan, Vinod: unless you would rather take this series, I will follow
> Anusha's.

Fine by me, TBH I hadn't yet cottoned-on to the fact that the cphy init 
sequences had been buried in the dphy file so, I'm happier with an 
approach that = a separation of concerns between CPHY and DPHY as well 
as absorption of both your and David's prior art - with appropriate 
Co-Developed-by citations and SOBs.

One thing I am picking up on with an initial scan is the absence of the 
clock calculation helper functions in this new series.

Anyway let's see if that turns out to be required with a deep dive on 
this one.

I will mark your series as superseded in patchwork on the understanding 
you will rebase on top of Anusha's work.

---
bod
