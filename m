Received: from mail-oi2-f4.google.com (mail-oi2-f4.google.com [74.125.231.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43061C5D5E
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 00:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.196
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785284737; cv=pass; b=SJjf1iTAFghX1s0MzzeEMwdOsRlB0tFfxBrXi7RshA2nQT5YV7TZeU9k5kWXhUEIi1ux97+DKtbU0kb+9xaQrFeprw/rTvTqBkXvluObqQ6KDSITSvNeaaA5FfI9JH3WkYBdZlciXefYzQ3Y2w0rKVbt0gcZZa0o89YZ2bLIp6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785284737; c=relaxed/simple;
	bh=urfn2gV2+IIAGKF7lAE/sJC63e/zI4c1xP0NE++iaSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p19FN8SwyC5L8nUrC9y2MpvCGoRY22ZcDLZCFn8OD/ZHzWUjrcmCXbwz2smqdG5f/p6P6VljqfATlCxSLFyI90cjMkklzpzY8rupW8SFSAvksd6RmkbwPTO5jGFsjn428/2LdItKMB2UjjO+1CIhBI4AmyJcVhz1E7U/U0omxAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rySOSGYP; arc=pass smtp.client-ip=74.125.231.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rySOSGYP"
Received: by mail-oi2-f4.google.com with SMTP id 5614622812f47-4961058e787so48697b6e.0
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 17:25:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785284734; cv=none;
        d=google.com; s=arc-20260327;
        b=Bak0BKEU29Aje5xqbTZ7hn0mGwMTD64DY1zSnTu2Wmr+2vw4njCmyWKRSBnWxSWW7h
         qqj5l0RXKkPlGwmatMECrHFjlZPhQghO8upnydsQnvtKpI8mRP3A5RcHOHYfMv6pDkWJ
         nzG0sdtYkv1cGRbtzpY75AC99P5UHleKB0VrQcjfsC+YzGTcoCnq7BeJFlU4ZJ1WfrdZ
         LEZ7lr/UJPzBw8sx9vrGIQy/MMrLooo9Xzt1qTqMQud9Z73DRVxtrpoRMkpOZ7aWQdr/
         Eb5Pz7TC9q9WVt15W0+q46GYJ2RCwJTlavAioNG1bdPoYxPWUgSd8/g5IOO9sTa47ZFC
         T5Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kPAqqOFRZVA56/B05RB3BhG1EgEuPcvqnYLmXO5rUdc=;
        fh=+yDnLOf+cdfPsUpEg/tuSSOSSG6x8EjDLeoZpn22fho=;
        b=q3Nx/NbH+LfysKrT9R+YeAvI2AxBKN0F2cYOWvjO0FpTjq9jOcjmgv96fyo6xf2Ghv
         b7q40cmBveIq5yAsGYtuFfXY2V024z2laW7JTFP9pAdbl+Bjt6ThEw3a5AYUUKav4kYI
         0yIwDYeQ/OtFKCoUyKguRQREmvy1jJPF9DlYWdYsRo2WkTpHqSPL8/KG98DHsMuPFGeO
         N99kr5QR4Qt61Sp2WNAFpxzUBN4wAUl8s15FY2K6PIHbTfq4kLWgSTLQ7ap8VpfU9iiN
         qdN+LeuWrKjkkvszB2P4H9mUtY2djEyi06sWmZ9hOZQaFjSbMDCluq5AfZR80pyTujF8
         34Ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785284734; x=1785889534; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPAqqOFRZVA56/B05RB3BhG1EgEuPcvqnYLmXO5rUdc=;
        b=rySOSGYPi0+zVsmqyNa+If5/iA5Q7eywPEIybHYJOl31pNAphWb3h0yQi/+6ZNYA3n
         mpi8lefqalimp9TRoOrtfB9tiyaarS8clZzVcENeh+ppWmQKNh+G6gyhY3AvUIvZBNSH
         /C0m16OvEMQcSxxioKjLk1YzBVbQ/kUh2b9d10cNacVfZ0H37BQF5QFJyde6PG835Q5T
         lBfFKY3UmpuKhMoWrAgf0E7Z+UoI3UByKi2xURbahQdlbxLkjUnMaq3oG4GPDdXPxIyy
         sh9McrnU3RdTyoLyqVn3W3yVkMQ11hJR00cCZRSlhasKoN9L0bq9076jn7WHyCjxkP+q
         CsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785284734; x=1785889534;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kPAqqOFRZVA56/B05RB3BhG1EgEuPcvqnYLmXO5rUdc=;
        b=GQzxSz5BK5dEn+1Ms6VhX43P99PdT9avJfSYYDAxa5BeOPiOBIN1iYbRzo4MN+KBUd
         oEhsNdIZ8DgdtuJgAJIoyqLs7wO/cxNqREBselygY5hTHDvCob1cQ5AzzLI1ur3FgmJy
         KhRQVLx6fX5hsRCE3sXTGqvFOEEdAWfCSE8bYZaSlY1u17FeY3IUcwyypd5n4EATqDto
         nNTyL8O30ieVofXw2aWjtEkDD6WRxajqdbnS7wTqSMBNU089vthWIFtCvq0TyN9chLCN
         cshkvQnAfbTqMnhPOB1M7vjC9pZflTQ5Jp+L1l1WN3W0v8QTEoEmUstvZypvl2vY8YZQ
         4rvA==
X-Forwarded-Encrypted: i=1; AHgh+Ro5iJiHReX5KM1CRZh/lxfaAEHRyizXj0f+nqsdDL3I1Q2Gj2EDq0KgaCsnPAlBk7DXzjO+u5Wj53YmJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxts7ZcEDpfOzJ1K/11Y2yLyiB3AuXuSl4bwvL8DI3VTu4GOgx/
	UozXLhbA4ev0CzOsru6Dz45mxPsoeMuQzcG/G4O8lgxzlAJC2y0jEuKweSmRWVM0gp/QBjrCiKe
	Nrjsi/KCKs9z/iI4EW8/amLWKbsrHO+HpJ0SrT7o=
X-Gm-Gg: AR+sD13/USC+Abb3YSgEU/Ju74V0EeJvCmRUOd3VuC1yxn0RjtUlBRIuds6QrJ7WhIK
	fwbmuaM6QNrKbjyycZDNYESltrzdHLsfRjlwxFvFuNQYI+T+3qmmsiCJbnD0ioMwNbt0q6k/uTx
	tTbDE1lR87pnXc8RWQYVOAnvWZQBPTA9T9UrBfLXpXH5rG+D8NwLNBZhXBrxNKt+gP7l5e87M+r
	tdeUPPwGRJigeanWHlFr37jvDWQdf0orw0MNCySgjaEHXgCHnyt3mbzXwqiymgLp+dMW/bFv3++
	sQRpY83gG6ahjwisURADluxC+1TXni0lhx3l/zxWgtKT
X-Received: by 2002:a05:6808:181e:b0:496:10b0:20f0 with SMTP id
 5614622812f47-4ad5beba457mr2296969b6e.42.1785284734582; Tue, 28 Jul 2026
 17:25:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604051814.41738-1-dennylin0707@gmail.com> <59e9c722-f58f-498f-833a-41eed573c23e@oss.qualcomm.com>
In-Reply-To: <59e9c722-f58f-498f-833a-41eed573c23e@oss.qualcomm.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 28 Jul 2026 17:25:23 -0700
X-Gm-Features: AUfX_mzvGqEs9OEc5qsrnpcXTAS_F1jnl7BhCJ2N0FihZr-toiiTR3QLOhcUJLM
Message-ID: <CAGEkeHc2JNfL7SfPk7Ad1kOTftnBhBtdLk7PcURZ-0iWwTL4oA@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: iris: rollback OPP vote on PM resume failure
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: vikash.garodia@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org, 
	abhinav.kumar@linux.dev, stefan.schmidt@linaro.org, hverkuil@kernel.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> opp_set_rate(0) would only drop the performance vote but keep the
> clock ticking (without ensuring power). If the device's power state
> remains disabled, the OPP vote will be kept disabled too. I don't
> think we need it at all. The clock may possibly need to be disabled
> instead. Or maybe not, if it's hw-controlled (which I'm not sure if
> it is)
Thanks for the review.

After tracing the call flow further, I found that the maximum OPP
belongs to the complete VPU power-on transaction:

    iris_vpu_power_on()
    |-- iris_set_icc_bw()
    |-- iris_opp_set_rate(..., ULONG_MAX)
    |-- power_on_controller()
    |   `-- iris_enable_power_domains(...)
    `-- power_on_hw()
        `-- iris_enable_power_domains(...)

The power-domain helper only manages one functional domain, so it
should not own the transaction-wide OPP state. I will move the OPP
lifetime and error cleanup to iris_vpu_power_on() and send the update
as v7 after validation.

Also, sorry for the versioning confusion. The previous unversioned
posting was intended to be v6.

Thanks,
Hungyu Lin
