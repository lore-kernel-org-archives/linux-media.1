Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBD52F6562
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 01:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784858209; cv=pass; b=sIHNQxqBC0TLHbs8yIkBa8Rr5LF1cONSmitNx+Hti/5vcLVQbGth5UzLU88em/VCKpTYS9FK8JUTqeye0HHZG+YI/k+uyd/qfIlo5MnnRVT8TV4Doh86Is1Sv83lTAKb3guJaEpxF+dK8frDPlplEKMKl02MVU4NQJszrD6LSYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784858209; c=relaxed/simple;
	bh=iP84btfrOhWAIb+P8k8wn0gRS7J9zVaBuXHX22GBgQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3BzKN0ZbdP9ElFA0sQA6BD844krUOMhnDreN2kwkM0baEQRCUPabi/bKA+WEQuczQIzz09q0vS33r/6fvyajiX6qckC164vRL2cM3DeeAMwHlGGoKOtYXhYdeE75dt3UesqP8Rc+4G1U20VZ4IbfENk8CfAK6Lh7oO8E7K3NjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X0xYN4O4; arc=pass smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X0xYN4O4"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92ed3993c1eso77791885a.1
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 18:56:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784858207; cv=none;
        d=google.com; s=arc-20260327;
        b=eZzY5bk6P2rqx8ImeYaEx9dexIBuspn1gVMCaRwae0bibwOs21Ba8Ucis04RusiTKx
         O3+uyTmItVVV2gamnnRGZuwnK2Ai/iFhDHV5sGebXSlCrKF9EUauUY2l8MfZtmHCPLHr
         9NNmw+nbjcZ/lBsJC748U9IP/9SGTaDeZUpauVH+hhYzoS7iYU3XK/NH7uXMfNnKWwzE
         YWpW5I/iXnM43oNRHTTzeAnipPDWlNwTxbxnxOzp0FZsGl2nYg2ikVnGYu7NOPR7WxCM
         mYon6qscy7MauLt0gsCLFMmD2u5SYL6hULH2cZ4aaaCvAP5rGArnFr+6lgrV2xpRSMs+
         eFdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iP84btfrOhWAIb+P8k8wn0gRS7J9zVaBuXHX22GBgQA=;
        fh=x1qY481WwDc+yQ5ipS/YXVxH/EJ+SUlOTS0dUVhQLBk=;
        b=kh9Bn+E/nHmi8JLslk7N2HkeubM3mXGDBSCzUVYh5188QiLS5BdYxdP4wWJi7YtvGj
         mm8g1r9/22bP0UWqacouUAPVRGuaWa8SYPnHepLm4ol5kK+hLzihUDKInU9xg8BElnHK
         6Fj9hXVwuyNVnQcmDEr3gY91nTbME8zb+lHnvnGa/f8wocrxah4X9uNzfNtstTkh4HPc
         4aC5qipMa9VPw0PS7+IWNUmb3ye7EXfTQjQt3hGH4iSQWzo7aM8eCwygqAG9ghOAd/uQ
         3fu+PR68nqT/AMF0qGCNyxR89hOW0myeZuhFVxCfoxD2lsQtp7FgrNTNnflAbVxn0S3N
         EoAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784858207; x=1785463007; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iP84btfrOhWAIb+P8k8wn0gRS7J9zVaBuXHX22GBgQA=;
        b=X0xYN4O4BB8wqvK9BV2ZcV7eqqE4j0tUQaSP6u/Tpp7jf3K2RSk5WivjOOWpDwV2Pk
         wiU7zDpbOhhS7g0ZRXfUFwSfeenTfR41eF2fBYfZZ3i5F0EhUhh1ABICAmCo17zJrpGJ
         W30IPWUD6ACCAzeWKMZqBnAb8ZsNBtnrY/gGdZlRDvzPMrd3O6CoB5LfhSwinxeW7sWz
         Yrdl8jjXMIxhgkU35qK4F619StbJ7MGnceNh+4xQAFQgy/PSqux8JMGbb1bUZVlEsnoO
         CYWj4ESqOPHuM2wzH2vMUhKKVhi9x7sq/oQY7LMNO6uKyV8ILgbRg/vsdxXA86ntAO6g
         XSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784858207; x=1785463007;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iP84btfrOhWAIb+P8k8wn0gRS7J9zVaBuXHX22GBgQA=;
        b=hDen1UOTI6k5dMJ2HhG9ag6RUhfvqWPZYrrHKpZx/epYNp1T6Y24LAdP+n0Lw0balO
         CzpzATRQRAmDGyy/C7S8C7edXBhO7WdNwEnrgYBqW0kYSdFKVowYhqFrtCRosweKqiZq
         u27tJ2KxLCsXnY+1FCipXEyqJYYqlO03A09N8qpeyTSCyL+/B0cMbH9n2970dtzd75qb
         B0chnDiQXFSPebcFyKCzSGzrR7AvyoEabm+EhNiNFgVu4TEOpTmFsK/Z/sTUnTxC9Bv9
         fvo3eTk+NJU8f6HzBV584p+QwWTUIymlBWX2rmwkhAlr9RYyG1ylWJLUIablZ1+4Pqy/
         MKDA==
X-Forwarded-Encrypted: i=1; AHgh+Roj5UtGooJ9ORWTOlU8q0vLhHk3l1M64qsj7GC5Z//yze68ekxGCgw1JThWP4elQZQQZoxiD1PT+VR/dg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyykn63ZlQsvUevm+1tRRmxkmYskXbyT923h8+ACgYnqQBV0ejn
	T4nZ6l4SLUZqxOol4HyznXJnJcu9z7tCd4NTolvZLH8Nnh1G0eZQRgoyIKYDNEG9zGPUzvAyZKa
	X99tbVr+xQ40WMKfbml/aM/3CatSjxpKkZ3QE
X-Gm-Gg: AR+sD13YPz/nkUDd8uUc7l0kP/imq7iZSrcE7h7Zk9pWnf96f9ycvwDG/gih1I/dOXF
	pyvkJjLgtWmeQgDJTxpPlBLT6rCmQ0rWLu4OcfV63LH1qZThFnuFNJk1h/fRZE3m3ZQLQpIAa+h
	qcN41cX9FqIs36Se0neYTt+8DYxmyNOP2hflpWDYlIHqG+9oohFkYbotNXXSrKTFiby2SoNBnHi
	eQtZxVfOiREJmKE0yXp4/WqI6eSQ6LBbzq2s7yVrNG13GJNuuh3Kcs/S04hcTeYd7bl5rFEUlTq
	3v99uMh6EL8TdOGQVqFgjFIqFvw43rQwk7t1iyHH7TktacKqo/cV
X-Received: by 2002:a05:620a:3704:b0:915:5cbd:1d96 with SMTP id
 af79cd13be357-9310360605fmr579615785a.33.1784858207478; Thu, 23 Jul 2026
 18:56:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723153656.2167-1-tharitt97@gmail.com> <62e3c0b4-831b-45bb-a7b0-b97be2cb3722@collabora.com>
In-Reply-To: <62e3c0b4-831b-45bb-a7b0-b97be2cb3722@collabora.com>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Fri, 24 Jul 2026 08:56:35 +0700
X-Gm-Features: AUfX_mylVmcRprTv6Y3jwq5H-M0MI4OBIkB2IESI7RL04jZ1Mp4z8XxWhgRJCvQ
Message-ID: <CACak8wPMt9Qp6xSs6AATLRjH3pHgFvvT0xxGHQY3q_WQWNO_BA@mail.gmail.com>
Subject: Re: [PATCH] media: verisilicon: vp9: do not arm watchdog on
 preparation failure
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	me@brighamcamplbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="UTF-8"

> Nack.
> First it schedules a software timer not an hardware timer, which led after
> timeout to call hantro_job_finish_no_pm() with VB2_BUF_STATE_ERROR parameter.
> We need this call to complete v4l2_m2m job.
>
> If you want to stop the task before the timeout you need to add something like
> hantro_end_prepare_run_with_error() where you do the correct sequence.
>
> Regards,
> Benjamin

Hi Benjamin,

Understood. Thanks for the review and pointing out my misunderstanding.

Best,
Tharit
