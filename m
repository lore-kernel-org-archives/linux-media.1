Received: from mail-oo2-f4.google.com (mail-oo2-f4.google.com [74.125.231.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516EA2459E5
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 01:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785286850; cv=pass; b=eXwdPKtNs1JbmVDY4viO5xLjT6iZ1ZcKReL6yFatcRb1PkbreeLIvMYm80mSkYi38C5Vj5YmwBrmQojB6tpLsW3W0KpxNPhx3/YRajfmYiZbGRp5pg6TTtau7t6RSZMNgisKlouRFp9V/Vd3r4CPzU9nTO15IBonct9CrwRn/Aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785286850; c=relaxed/simple;
	bh=0A9LpMbKDLWB4hRsoDwyEmqhSZbsjDQKz1BDBkhcNO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I7PjFz5/qGE/bR3vjnOEBIqyrcOrDEyqZR53RI4XUkLDrVEuRP9h4mtSXdLQNAiCMY4O1Gbbp9DXe2Z4hh0bzhkgLnT5iS8gV5lVV55Eui7NnBrmLzThntxlhlKzvL/38sgRu10j/034m5+vPrMXYuEmoD3ms36M51YymxhZFwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvllsZND; arc=pass smtp.client-ip=74.125.231.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvllsZND"
Received: by mail-oo2-f4.google.com with SMTP id 46e09a7af769-7e9f9a3167aso144442a34.1
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 18:00:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785286848; cv=none;
        d=google.com; s=arc-20260327;
        b=G/TzmlOUSvS0t6umBlP8fY9wvU7ANiQP65b6oOQfGEZk+Si5zl53yYtiSF/+sVGj4f
         C0ynJM3w7uSdNj0qn0e1QKoGN0IhwfG+EoEtNzzpam9QOQlFpM9oaB+mxROtrCm07EU3
         jn4+y/BTtyhWTQFd3WNwH0RDm4gVkQM3KIDFAV68ghmDVGFNzgxJ5Pf7LBD4WRMueF4c
         jHEtZ3l0oEQW8kbweOlblK+crUokJjsYq9OACJlXTLMEFZbcoQT1738bqc6SEtBr/FW0
         38hOIVdLIe799SooQV8LkDf1ocfykRtnn8onNqP+t+XtvSAAQgJgqPU3JcJyKB8G3by6
         KTPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0A9LpMbKDLWB4hRsoDwyEmqhSZbsjDQKz1BDBkhcNO0=;
        fh=v613Wpkn4KhJxmD1uTma9hCdMZQZJyYm9fPEeo7Of84=;
        b=fvONN0jRZe6/vQFgrTffVteWfLIQTmMDrcwoWzhlGuQIgBt+Z3mtM9+7A7J6nkpHPx
         aQYVTRo3FqMziU1gqfO26YqHcw7C8m8qmnknkME6hT0RXJD93A7QhYakM7ASEWgiQ/Ap
         yFn2WDjZn/B55jQwjLhy6ktpQ5d327v6218VtE03wP6npwfeqXH70exep56IDicclaxI
         6ujM4IiLiZ2QIjD2Md45J/rJPsAJlnpmzO0XQvINjiZ7QM9jlMOru9NwRfyil04/zAp1
         rbOZqr4tuWWQX3RLtGl9tx1RSX6+3IWMLr5X3QkcRz8MeU346SN3uMz0JCo8iBu9f94w
         IthQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785286848; x=1785891648; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0A9LpMbKDLWB4hRsoDwyEmqhSZbsjDQKz1BDBkhcNO0=;
        b=dvllsZNDPplTOZr7pcyJbQUSCGEDbgW5qG8WbMOPrrZoruidvJQjcld0dOgozlBJHj
         ZX4X2g8NugNJV1wDph9qKJq+AHYzT9P5maihjxzjtW407HhiPSGBfKnJae28AMrzd1aW
         Dq7eEowk9M8aXfnY17DxRbCkUH41iRXgWrS3xK8J4LccwhQpGk5CtSJuVs33YBV/9XUg
         ZQ2ZQKCTBwJDN6rD76MfLn+Dm+ywm7Gfb9CpC4mCN5dKPCUs0n/CBy5ptW8yUAbFXCS6
         ChX13rNtRZ1qrbMLeJ9YGcOXpl75b+GtDQiZDiVNQ/XKyNFkqaz4GYLOZIn37c+ba9PY
         hR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785286848; x=1785891648;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0A9LpMbKDLWB4hRsoDwyEmqhSZbsjDQKz1BDBkhcNO0=;
        b=S6C2JMJ4h92Sef03TXoWs+shB29SiNrEqFuL0YHIwfP48qtCmLqEdpYTpxWAaBax2c
         NqBCcLodRvMYmzptM8flBzl/ZNlXOXHSm3thDFCQNby4AtHS3lNMlB/Zv1gN2zb8CIEf
         e5wQOvTM2uzlis/JfjLweWIXMYgViqrO9woEZUd8B84y9r/zOKAN/jUtlowOSCtCDh8L
         lWIhPyIjIiMtZ0uq0LtpiDKBEY3xAV7wdFNUeNiCNOwilugRRUO/GV6vkovLwCk/y94p
         Cq8MRZrYmf7lTUwSn/C5p5bRKKr1+p+2Eq7gKxR60ditQababTRp2uzoF6C/sDXuofwt
         zSPw==
X-Forwarded-Encrypted: i=1; AHgh+RrXWbxLuchdJ4EP+/lS6JWmE8xAm5nDxIVKXyMLfOQeE13BSbNy83WUmWzwz46PIpneiudMu8/JAY7mAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgu1aHUQD8MksF3GJvXgsPMeJ4R20TphsitPcnO6p1B8d41b6y
	+w4+Zz8AdTbwYg5/TSyjDI0T/3kJIi7JISzy19owFu25Gk4LrQIaSjbbmgpoEJrWvsS0f4CKYir
	yJZBlX4HHYZQyVkf5hmAwt3Bgn8kYIGk=
X-Gm-Gg: AR+sD11l7d4wjSm6FSIZIjxKFRdZjAJSRx6S2FYPTGtP7w+KSALKu0IFP7Ainmg/Xk2
	D9PAIozbmHMzHvod0SwIu9K2VzqsO98PxcXop98fxl8k7btP1KMS5WaRz7z5u+cNcny2yIpe1vv
	nkdgIClkqZUkRcx+ZkfO0j7pEEzvaxBaMojs0oazQtNVlGbF07lRzv4MPjCuE60z9nvZ5zYMwX+
	mqXOEvrR035JWCrz9sDJ2Wiv6gUL2gioyhXHyD+Rk/bpaZYL9ZR/nJ4AWbJ5S0zxUwfUuPdv2j0
	UPPtbTna1I2kEP1rp+xgRn3kTjqxCXcL2vEWcYepxsyB
X-Received: by 2002:a05:6808:138b:b0:495:ecd3:ba29 with SMTP id
 5614622812f47-4ad5b8d3dabmr3207669b6e.35.1785286848133; Tue, 28 Jul 2026
 18:00:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604051814.41738-1-dennylin0707@gmail.com>
 <59e9c722-f58f-498f-833a-41eed573c23e@oss.qualcomm.com> <CAGEkeHc2JNfL7SfPk7Ad1kOTftnBhBtdLk7PcURZ-0iWwTL4oA@mail.gmail.com>
In-Reply-To: <CAGEkeHc2JNfL7SfPk7Ad1kOTftnBhBtdLk7PcURZ-0iWwTL4oA@mail.gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 28 Jul 2026 18:00:36 -0700
X-Gm-Features: AUfX_mzcqNFVVCs3GcI0TEPFm3OatibgZITS6Csr40n3rz26lvP0GrMig2fl2F4
Message-ID: <CAGEkeHfQwJG319LqtFj4mGOf6BRd3dMUB=CyrhH+BTQbZibTMg@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: iris: rollback OPP vote on PM resume failure
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: vikash.garodia@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org, 
	abhinav.kumar@linux.dev, stefan.schmidt@linaro.org, hverkuil@kernel.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> as v7 after validation.
>
> Also, sorry for the versioning confusion. The previous unversioned
> posting was intended to be v6.
>
Correction: I got the version number wrong. The unversioned patch was
sent before v5, so the next version will be v6, not v7.

Sorry for the confusion.

Thanks,
Hungyu Lin
