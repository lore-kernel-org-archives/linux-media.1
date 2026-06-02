Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68672379C5E
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 22:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780438528; cv=none; b=DwTmrE8WOqpvrFX93FRf07dwMzLVMPsfOumPlH89beN2H3irI0G0MLzcN+G/rhfxWUhZGBS9jOizzUyplxefBk7ikCWOTQd2w80jgjWk3CTvUKd5fkSYs3CezRSJ22E1rUQqJHxG5UI2n7WhvYKrniWLfTscyHyXdtTipKndmFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780438528; c=relaxed/simple;
	bh=0l2ZoBsNnuodhMPRW4K78PbcurismS2rK+dwCagNV1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BQPHm5uY5jIcppbjP4EsunclubUT6X4uaLWzeSOqZQmG/PPA3qPJz6JKQyEPhBGb9Jg7KTJGEIkL6HXml4ysfVL+PYtIpc352e2BWI7Af+NMPLDRXok7bLhCVUibBWsdMB+BVF1HPLqYJpP7twHaM3mX3XDw1Y9abOSSW9xBHDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e8rHw67s; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e8rHw67s"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa679cc2c9so393860e87.1
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 15:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780438526; x=1781043326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgy25aO5siADmjOHA8m8ArvPv18ukgqv39s8uxTpK68=;
        b=e8rHw67skHmOQ8kPoTe6+oocv4OUg/IB2nEMr+0fpK4i5Gb2Ty7tk+7gOoSVPyFYkj
         cz/rgfHDQo3o4q3rgEEfot2bUDKa/U5IhhwM60C5H2eqV32hKrWQOizcVhOhjldx6VFJ
         7Gy4PbKz6Q7O/j43kO62HDI6B7Dm9I/BhUsVtrgQs8+vW8MS+68ML1f+aJtRoQF9neUF
         zzQ86WLaAsy6UcFJiXMskcb3xNHNAzDElazx1IwJinN183bynJ6KCOrm/AZFplO8LuF5
         XlprvD1OHBrBF0IoOIm+TDoV/lCxVXfly3/xY8SPgMXRqMLKXSVRvtXy4sdy9o+7QAsW
         4e7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780438526; x=1781043326;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jgy25aO5siADmjOHA8m8ArvPv18ukgqv39s8uxTpK68=;
        b=W5EMzNjXXpdk+EYTKLus9p3u+LLgHPhI6Qa0e6J94tLIi2wKaeRu2lbNn31nI3DKuD
         AI0C2tYLnI+XJg7uuuXl7AMio0HCQ3pa2WNbQLdd3+ol6P28ldQWU8ZAuNHXGbAnQ9vq
         nEo3dwL4OPtSu9iImv3wVPB+Ew8xajxRVHD9YKdslAhmpUtwMB3qYj71nbQg+/li9iTb
         02RhAt+OqGs14Pcyarji1y19w1+QNRnX8wUg4PbqWWhaPAA42tLGXZaWv7nGQLFq9SLe
         3fO2TRzGgYhhr5KrxRGDmD2I8ZGkgOMk303CQUPeZSQ1X7+9bDXM2+zKplvp3+ncYp9B
         QDdg==
X-Forwarded-Encrypted: i=1; AFNElJ/xqDd0/37X8tSN3cUzFfHBkItNla5rrznvdiLDNCRvMSO/Vl+6xrGgnRj514zCPMXThgBVabZlCkOjHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGpNLJ5NhM2SXgCKIj0KGKXfB2hE2yDq6chuGkqDEXVJ9r1XE7
	a7nm/EnSWy/P3xa8L2y1DaqxEodiTcjEcDBF2tQzdXuzVXYjk9ig1/pfDvSf831tgC0=
X-Gm-Gg: Acq92OHgoEeUpsKWfHKns/u9fDhlF4/T+GBjc4w61Zte9Jw2esm5T13hOXaPH5L00CK
	0+in0HUx3n2ZGwtf2DjJOooLpQg+syFYPp/Hsyo1uvt7vAmo55rGHUaFknRILP3SzcK7tQlcKWj
	qPVpubreYtdjYmzuk6s6JUwEECh7AQxNYmj1BXHSfsnUAhm7BTx0EZ5kb8L3JTgdMSxwGXN6npZ
	mj8Ea6WNK2ZyNzK3skRUyKvApKc0hSjOXm3jMvLUJ8KfKwZ61XPz8FBKWTCNBWtaCWqCpToxXK8
	Omq5qhTuyjn3JzrQ9ZMeq4se68vcxrgbgHMUzF4vnlITh4f6vSc5HBSz91SFd5enx4ZXY3v8/Ts
	OqPrF3yC2neR2ftLKARa6pXtAbBM9hIiYmRgCeW+vlVAOYuLvyefoUlXrUb96zaDytIHbLcRpyQ
	W0fDU0d5OsA8VOtorZxt9Z3sBhWvBjYCS7lwp+KY4CUrluaRVeN/B5zV4GJvluWczG0RSnIblao
	4fqO1a8YZf/sKAI
X-Received: by 2002:a05:6512:3c95:b0:5aa:7126:c62e with SMTP id 2adb3069b0e04-5aa7beaff61mr128839e87.2.1780438525691;
        Tue, 02 Jun 2026 15:15:25 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed2d3sm217245e87.5.2026.06.02.15.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 15:15:22 -0700 (PDT)
Message-ID: <d9564f1e-0b5e-4c69-88c5-b57ab2e0b543@linaro.org>
Date: Wed, 3 Jun 2026 01:15:20 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/5] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20260508-kaanapali-camss-v13-0-2541d8e55651@oss.qualcomm.com>
 <20260508-kaanapali-camss-v13-3-2541d8e55651@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260508-kaanapali-camss-v13-3-2541d8e55651@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/26 11:05, Hangxiang Ma wrote:
> Add more detailed resource information for CSIPHY devices in the camss
> driver along with the support for v2.4.0 in the 2 phase CSIPHY driver
> that is responsible for the PHY lane register configuration, module
> reset and interrupt handling.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
