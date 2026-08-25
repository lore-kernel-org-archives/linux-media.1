Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70686446846
	for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 13:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787663275; cv=pass; b=VJc9/ssm6w8h4V4ivjb8PKtAb9uCrZgENv+CvqgXU47ya66so1vnH3sFO8yn+00qlEsMknhDOaIwWxpHmJF8XT9cqLZDeWLldojCFhW+hgB0OOEJpKGPN1KTNgTQqehIE7xoQBt4uTwqrEzwtybFeeatajwrGSJZEmAw8M+jdfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787663275; c=relaxed/simple;
	bh=V7mtCxnPHIV4im1aK68BcGgivPwOW5wYk1n0c2wW1UQ=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P1IQK1xQMLNALLY7iq4Lj+zfJMpUQBvvS3y+9KsPVqOzzqz2IWa5SPaZow1IfymfqzlMlAoTlLEg4O2T94bbAq83KPwIE1cUiM9+s9VMralzbtrRpr75wMT1Rp/OlqOvonzuWDxF9QwRhOlmTnYBl1RdB1BV7GaYKxGhISK3iAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stromback.com; spf=none smtp.mailfrom=stromback.com; dkim=pass (2048-bit key) header.d=stromback-com.20251104.gappssmtp.com header.i=@stromback-com.20251104.gappssmtp.com header.b=CmRIciBj; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stromback.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stromback.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stromback-com.20251104.gappssmtp.com header.i=@stromback-com.20251104.gappssmtp.com header.b="CmRIciBj"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66d0c8d0d6eso1663917d50.1
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 06:07:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787663272; cv=none;
        d=google.com; s=arc-20260327;
        b=jNBmxIyBEWvMqqwWhIfRNh89tiCuXvbyw2dAKLA3wZJ65vu8jC44xOjII2IMJx3o+r
         9dpMkJIV9/KdIhCjS/gmnuBsABcuIslx9xpwLjEsHIzWVYr8IhakuIR0UnjeI7lmFTW+
         DG04RVX8xlk6pQobvzbiGnkrWInqFWAIwLAT7gr2UafFHpICSZno1o9NuWABcfr2ACI6
         AKd3l8obXY5Ewa1JKzH3vnc/+dwp9YNip1ROUvt0Zi2H8QT0oM/+9A6/e9ItFcDLEdfP
         1nfslL5Zb0rAgxpEcHeIrqYVseRlmwgebWLRIzx89KWFRLSyy1VNR2pvZYpBAFYpEf88
         2d/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=V7mtCxnPHIV4im1aK68BcGgivPwOW5wYk1n0c2wW1UQ=;
        fh=6T18VOU80/wLitPTs5CdPcwCvSQIvODX9Pq3vt3wZk4=;
        b=Pcw60KKcYV3Itm+rgu99/7Alil+QF3z+I6UBO/vqA904cFnm3bO+MBA2BWz+K5bVX1
         NXP9Y0pmGbwwBoTUGXc/Me8pYWEmWFUxxWIrACCfP0/MftYUcriDrREuzx7DGDcrxvzj
         Gq8Qggwzhcncpfj9WsjE29+T7CWO7IJVBpQPRtaxAEAWUe3rFGJ2+y+2k3LCuzqeO/l7
         yqwHgKLUSr93YJfF8ComAJT9346QSRiz+V6Qf55z+thS75pba6gOXFswAe+UqA0dBegH
         xPutxXs7bUliEmJeTCuaT9wbAJ3BJSb1v8ljdDJ7vfaHU6MBLZ4BPHBj+r/fUWesO9Zz
         oqcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stromback-com.20251104.gappssmtp.com; s=20251104; t=1787663272; x=1788268072; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V7mtCxnPHIV4im1aK68BcGgivPwOW5wYk1n0c2wW1UQ=;
        b=CmRIciBjqw7bTTDTlWRA3KrxLrpsblziqkY8bic4sXu2zPjrxJEy1wcPdDEwXOD9+0
         mqynEfCnK8R+9eJhyvi1gNIHF1qq+L0ozM5A2fQTgJ8RyHmDxlJQX++DxAkf/TfnG5ct
         /gxeNhbbYnZw0gYjP8uWgXw/trW1egjVKrctEKYKw/6tN5j7EaEVsQ707umEx9lyTI7x
         Gj66jbL4DSnRwO8Dvx9fnxRvRsf6CvmDDw5Fz4ISPJIvkuUQQMsd6V1fREh3Pxx8ExJn
         wnlMTicOtqCw74pDheUemLgzp5lXdSTIi6qIE43A2Lm4+dnmFIdnK+ySP/ZrDFZezdyh
         4mfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787663272; x=1788268072;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V7mtCxnPHIV4im1aK68BcGgivPwOW5wYk1n0c2wW1UQ=;
        b=QtoXm60o7swP57pytvKNAsy5Hq5OX4caYFusCCUUA0tz0Nch9/OnQU4SPj4r5Xam1k
         flz9teQ82QbM3SGeB4Uo2ZyBrYocwUwGZmccOtPCIQzyAN0AGn0n6ikCVXJBIta4JEYX
         cs32eujDge5Y/Aa9ogHKo3prrHf4ilH1BfWjV0pgV49CUl6QTRZOkgvEUuYCj67wSCe2
         zml56RBHfCuknU5G/LQodB/soLLul19n/VEBxegZcTBFh7fA777HiUV8M/uxsYqMxTbZ
         tZHn0WLdkQQ3Dbd6Q7rowoJ3esg4q/ghrByCpM/BqN0T3XfoILgsuMdmtUsj6izle8IB
         g6eg==
X-Forwarded-Encrypted: i=1; AHgh+RotjJSg7LUv3DBnKKi8P7YKfUSfUg2AfxN94+bCU3qct5+lteV3VDeK7vYkf7HPZrGxDIVcsuZklkTDmA==@vger.kernel.org
X-Gm-Message-State: AFuF++nP6AEB9WHDaKT/0Yi5RMXmBFirRiPueo7Z7Ae3a6nFuw+4ywHK
	IC01B8DvrWVYQ7PIXaNQgaQ3mpNjomEZB1ZN9W1MHVCSRAo2OtDv+PqQFsHyqPFDFntaNf4Okbx
	rzatqcfT57uPVkJ/h9SJxZSVFSIFqu8ZZMOqIJINOwejkL/wBmAxn1qFnUw==
X-Gm-Gg: AR+sD11SMdRJnv7ADVvD14K61Ed5GAa4ZKwqRLve879QQLzZsatd51ch4+v5hY7qY5f
	CnAuDvC7ftES3PcclAjRsgT0T8tDHjCj25nigWuX0x47gehnY4GxkoZedl+VZHk1eeBZNiIYyjm
	O555WCQhzyijXCw1VcfNdiCOl/Pucyj3MlT+phBv9404wbQvF3Be4ys2NnElKYfmiO45RSQQZrI
	LzvVpt39sE45SEXT21LSeJGeFdAETOOr5ZtFb1ONLVmNL9PTUHvZdJ5SIxdNorEJlTRJ+P460jw
	r4iv010J9Zrtmndaszz6CZdRVCYm8lapJfVnBgp+SRZwvu8ixq3Dwp+2XnD7Bh945OxZ41fHsbE
	qxCJaKV3toKbESxPjGJG0K2PMAmFEIaSPTENBDCZMbYJJIf9AX6zWXyST8rlXUCo0cJ4+1g0YMf
	5HatMFzvT8RCHeSqirUxyMfA9EQBOJEAdM1h11kE30cj8+bkBymMiQyZC0wCZHWzlNLsnxTLRyS
	jH4WDC014xmQeH3UQa8SrVxFx6tMTpDEUSzQrB4/F42S+ZwapVr
X-Received: by 2002:a53:ac12:0:b0:667:9d88:97e0 with SMTP id
 956f58d0204a3-66d14a7958emr1493984d50.24.1787663272047; Tue, 25 Aug 2026
 06:07:52 -0700 (PDT)
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Aug 2026 13:07:50 +0000
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Aug 2026 13:07:50 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAEth8oGry5QGabefhq8fWCRxQPtO2Fc-f7N-5t7XQBHgUJaKjg@mail.gmail.com>
References: <CAEth8oGry5QGabefhq8fWCRxQPtO2Fc-f7N-5t7XQBHgUJaKjg@mail.gmail.com>
From: John Cronin <john@stromback.com>
Date: Tue, 25 Aug 2026 13:07:50 +0000
X-Gm-Features: AcwNN1UGGxfqp34b6On3curtR3vz02MlJg0QBaF2JyucoW1T0rWl4IuG_ZFH8MM
Message-ID: <CALr1FG9i1oEU5AyJ8_y8qG9pUGpvrEDyAXLybmRvCRNCsb85Pw@mail.gmail.com>
Subject: Re: [PATCH v5] media: i2c: imx471: return 0 from get_selection after
 filling crop
To: hpa@redhat.com, linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, hansg@kernel.org, john.cronin@opcenter.com
Content-Type: text/plain; charset="UTF-8"

Hi Kate,

Thanks for testing v5 and for the Reviewed-by. Glad it works on your
X9 as well.

John
