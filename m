Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34863446AD
	for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 12:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217041; cv=pass; b=fMYPdNEiN2D+13Ac7clEzZWP63CTPvZMxU6yWFvAQRk0p4LmUth/EOENhb+wRngiJiCrCujNS73KhjKB/TvVkoVr2+uEQIdvQxA9dSuEJy47XFNRo+VwGpHRjZmpdk/v1Nwfg9IlERjJYqFefKzRHvzB1q8NLfVRTvS+pRhy3ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217041; c=relaxed/simple;
	bh=QXsVuVkPzMKH+I5YkN2qjShs4J2XXpG8B8OCmd8V0is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=geE7bGNxaLTBwAIrRQfqtLmVG0aTwEwmD6os4Y6XLG/tqMgZdux9/cBeFE/lEU9O7D5Hp7uFcddNBXXD2HhwgemX5bIxUtNuOYtEeS7xNUiZwhHhp7pUyW/ChxVQfFXU1+U8kzYMxWzr76NpnnVcD5l6/R2po38B2u/2RycDkU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJdqE8fj; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJdqE8fj"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so183823466b.1
        for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 05:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789217038; cv=none;
        d=google.com; s=arc-20260327;
        b=gdM2G5IsrH/rmhmAOHKGXaOgIpeC6L/2qHLLwmcQ0TjhaDJhREbfjWbS/DsqSQ8VcX
         ruEI17DdtelWN/fIHtlyviysoXZVajx7JBDCYGgfOlqGTMR3wsmjJZxEj8rMvDcr+iI5
         ViLGJHNSz0erGeR0X1483KzzZLWUPIKfMI3/O5n4zXFz7v0AgtMzYbNqFDea/Ea4AsHZ
         5oji2houVWSSV0rHnurGtAK9ChTdF9mLjxW2j2lHmzJAY1J9fgVmG+cI7hHSIbTb9kXl
         TNe7tEPRlyLt35GCLbKe215srMw/IddHb96U7bCcfZeNjvGqD1LzcXXL8kO5PXSnXU+B
         KBUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TcOTsszcSOMIWXzyK8gIUe4Zda3Ax6ifkDqKWguPPDU=;
        fh=ino8+zrl3YFZKAqynIV92503WDQALbVCRf9XsK9+A8w=;
        b=ihS+cHboWS+GE1+X5LxCwoeJTThblPhQsb61c2Wqt7+nqU+rJBJ0b5s8GK3x4AfkZC
         eSYFAOYOQkca44ToPHMXj9aqZotQsm4pUlnOSwpKCM7iyxUc0AdoGFtBKPOm3Lnc57aT
         9M275oWb0Oxqadr1X04boHQj7qIh0XzpO96tgAGyZ7JnQkWZ4ABzh4mYhN54JLaErv/5
         pMruzmCTmqbi/gnuMj2llvyFhMwATg76o2IAoWcU6cmFJ3XkpoiqR1yNXBLcaz0o5I0I
         e2R4CJCQ99kPDCqaiCLc2KvIkiMblTjxXFeqZ5dvvkuMlk0Ju+eNgCFOzJooR5UwHWWT
         WUJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789217038; x=1789821838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TcOTsszcSOMIWXzyK8gIUe4Zda3Ax6ifkDqKWguPPDU=;
        b=OJdqE8fjdMhQeEy9faLKuXMoxzhJcGtQRPbVAiWJI9jSKRJt9pdvwep15rADeuvJeM
         D8Rtc2c3xq0xQRautThSA25jtl5mgTdy2u6PWvmmXNWgvQSvdUp0yHhzAlF4mNSaxxvc
         GZ3cAfJNVzrtf/ly1B2/21S5+elx3WYamjxqKdNYsNZubs7R7X/AcXA6wxhJHHcW7pB0
         fXPpAb1urLcTzrMOLSfbqdbPLDntpZIc+vI9hvzflVfsJsy6B7RpoS3QqYWyaYNMoKgm
         HX3HpR8sUFDtOj2i5hB65K/khLBhDp8zVkoR8i469QbLSj/o/0NTLFOsoH/1AYput9pi
         I/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789217038; x=1789821838;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TcOTsszcSOMIWXzyK8gIUe4Zda3Ax6ifkDqKWguPPDU=;
        b=VnN2xiRTVksk68USC7Ue1W2J1dq4tQoW8Uft32zava3+BSr8TvDiGxlhU165UW8gBb
         g2azsdO77nqONciKEAoVdy/bFx7ltuIymgqcG3waehN+43YEOhMOOFmqY/RfjkO799CT
         AZgC6REjlDyjxdsiHQAhfHq/HVMwEDdge34y5H8r82rp30YkmZk6VDrL3udGv2Z36bbP
         tWXVWDg4vxYYVKIYS9jPDuinoCBLfP4awFMHsz6m8kQOH/64ggNVOXHSdVq72ukh9zCC
         EwMJmDWi6uGvyba6CH+O7RljV7KPklPP3eb35u89elJJNkfhEI+d9zyZdGK0yc6fVKd0
         dYhw==
X-Forwarded-Encrypted: i=1; AKwUvBzXhw2l7WJ+w0SML4kzTFoJSoam8FIMQ6D3dLo1UKCWPzPvX5gFRj8YzOc/alJicsPx9svLMZIsswnYWw==@vger.kernel.org
X-Gm-Message-State: AFuF++nab1ZUUcGfDwPMmgFw7t95wsxfPnG+rFYZG4KreaujPZAANFEC
	goJTw/aPF1E0EUmo/5hP81j9VSIPyxTH6uEIyStmIJZ/MF+ak3VBt/YdqAZ9Qz1zoMsmQoaD75A
	qr9+1gzuv1AzdAOLn/+mxpJ+88TJK+uk=
X-Gm-Gg: AYBFou2pjZ1oVrti6yRwZPrZPD1trzluFaEvpycH7GTxTUANRFYYm8uPv1Lof6lmq/F
	JDO1P8vTilaLA6dM6M95YHqU0mbMAPk2i8Z76zMo+RdShQGUvFD+Am4Idq8LToXlgDJSGaftA8q
	dkPdskKdZ5l3QgpwO+6w2XEgW2LKa8tWWkOR3xt9Z8qA4cFOQrRnT9GhfdH4xHajKXz5HFjAzUp
	6Tnht54iJBkCMyKFwK8wl/6GgL8pYuIlwFYFkaSmr2IWuewOme7ex8a1ppBw3go9TcyfeuJNy52
	5a5cRoH3IfTPVVuHyLjASSNzgm1qy/dxn+rVb8j/nIkmlLlagu3jR+Sq9OeizQy/hAM1uwGAGVI
	q0V+WTKzDr7yxlBdm7TwlEuEbt0lJ7fbjYKO4GTguWzFFlSPKLrFbbERuOm6bWDHRu0gIlltnkx
	q/hXiYu0PxFmKlzYZXNY8mX+SrxYbBCfrc0zYMYW9w
X-Received: by 2002:a17:907:c14:b0:c29:4415:2ebb with SMTP id
 a640c23a62f3a-c2966514d2amr454872766b.8.1789217038165; Sat, 12 Sep 2026
 05:43:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912072718.50636-1-kmehltretter@gmail.com>
In-Reply-To: <20260912072718.50636-1-kmehltretter@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 12 Sep 2026 15:43:22 +0300
X-Gm-Features: AcwNN1Xf8Q8vxBRZZKbYPDvge6p9E3QdV_MIMKTQ-L4mdjbEqTQv9VZr3tMnLsw
Message-ID: <CAHp75VdPKE-cLHi_SAUQofomwpo-CpebknvhUJ5WoUgVfjG9Tw@mail.gmail.com>
Subject: Re: [PATCH] media: v4l: cci: Fix devm_cci_regmap_init_i2c()
 kernel-doc return value
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 10:27=E2=80=AFAM Karl Mehltretter
<kmehltretter@gmail.com> wrote:
>
> devm_cci_regmap_init_i2c() returns a struct regmap pointer (or an
> ERR_PTR() from devm_regmap_init_i2c()), but its kernel-doc says "%0 on
> success", which was never true. Describe the pointer.

...

>   * Note the memory for the created regmap is devm() managed, tied to the=
 client.
>   *
> - * Return: %0 on success or a negative error code on failure.
> + * Return: the regmap on success or an ERR_PTR() on failure.
>   */

What about

 * Return: An error pointer on failure or a valid pointer
 * to a struct regmap. The regmap will be automatically freed by the
 * device management code.
 */

?

The part of the proposed text is taken from other v4l2 header files.

--
With Best Regards,
Andy Shevchenko
