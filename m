Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795798662;
	b=YR9UsZdk9G9aI3psc3gr93XwtjXIwVie5xWgGarlO01kmkH6e/m8PeSuFpTR0+YY4iFd
	 fLrmGxnW1eird+bRtf2B5aJQ9HVcDUaTg19qICrs2Zr1WjKjp2Zvy6w4Eesoal/hL4omR
	 tWE26QfLPEicwvWKy7Gh9UWMsVtzhmvmLajeHXrScV5pnZPEk6gkNPu0nLyxygTdVeg9q
	 Moc8sdhZcWPYNUUVi0+XEufDBoWPzGq2+HlrL+LcV+SPmMIbEFQo9vFmNRREEnRotYEu7
	 pDECqZDZYPkoQWx5OPwknoULh/xjXljdcEXQPNMCUVvbTvrXtMVwLNu9d0Kfvtlaj6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JoYlWYsc7qA+Bk9zv3r6KL/XVztnYAaVtmzSY0LmZ30=;
	b=129FGVJQLSkLBkvC8LoYx/fGt2Kd0Z3Jow2YM1XehzHBt4vBAsgnpjdYiWzhO9Dh37xk
	 LaQpGShcgs/dpB1Ltz4+CmyT1DmkU7ttYva2JzMY5lLC4u09JFlY19hLxrgIX7rdGwIPQ
	 jHNs7amRAk8rlNVw9HUbmB4X5CHQjIbsGXMGaRwveptQXI1KrY0l3+vr97FTmygW9UpBd
	 pWi/52SGuiNX2IwAZfsotVK3WxjxqFEJOHXh3G+tadb0k+DHh1PIqRGeQH1/6P+b/gZwy
	 Xc+jSgRPRH68OSo8CuxLYZHfpYXx6rdJJPq/39lHg6bFZym9skOY4n6bx8C8uZ2AfwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="f+CjY/BX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40847606A321
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 16:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40847606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f+CjY/BX
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5430f70c827so96930971cf.2
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 08:57:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795798661; cv=none;
        d=google.com; s=arc-20260327;
        b=BXG1V2xtJ6i5vqxV9QJ3AYqrVyNJ+ywA5lj2yO8KeFNU+SQFi+1GMxCJ2vo+s8Q81p
         jSyVt60vge+kPWKqbIdqWMk0KOMvyX7iV4eA9Ylm5cSHrcFUJvF3o/PLhuYoCc4VtolI
         2zZn7kM+gXN0nsu6BEq35cvQ1bGJ1L/t/cObm67kvRmVcG+vi+CZb3Dnzw7H9B6d17vC
         a6q4VdkS4CyS+wbovZSkTefCF9aQDkcS2vsAXSD1+MuKbueg2KRIcm5Cavck+jXN3i5b
         jZi4ceOKuzfXlCM3jyBRsEahW5/YJOVl8m0iKSn+mdlQfzGc0MhF7Ly6j+R2obtKXaoB
         2Z5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JoYlWYsc7qA+Bk9zv3r6KL/XVztnYAaVtmzSY0LmZ30=;
        fh=kyh8X7qdBF2lDmtrV/KunS40oHaD0qV4HBWYgW4ta40=;
        b=bwj30NsTl3mmpgwX4lG3EI7S+98ZVHJPC+h2Z9mfHuzF33JneWgf2F8I3UepC56YGD
         l+jwczQvzEyTnPtCKibCherCtd7qYCLHxzQSsEyHDuM6O8WxDigHfXkL8pNnvSp19iVW
         9G58Q/ekjcxULN0H/kz3T9VIjEOM87AoPWPCOi4C0+3WjKrXx9LjI+1hAsBMV498fesL
         rJc75MKRrGZYY2t8RdSbLhLUMQ/b8XJVw5094wWZdXqUtlNs7ATP4RcfXlJlOnxnBr8p
         GpBbqxcArthabT+pmPhRF3E/RfsY4K5708/vfVNcmJRW2Kb8WoXKKC78P0suP/yHDplX
         Gfnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798661; x=1796403461; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JoYlWYsc7qA+Bk9zv3r6KL/XVztnYAaVtmzSY0LmZ30=;
        b=f+CjY/BXcpKl6jzX9OALdg1mfYorM8PIZRIjW5rU5+YXEtkDEecpk4tbM35O+h2l+Y
         3BySmVV+mW3zLErChy3JX8Fn4SNdfz8iDIA4tmhi5DY7Ki6vPLJIZlQNQrgRm+e7BiZd
         Dr45nSTD78QTB0+Gfx0Yfaf4hrdQNxxnzTAPR2jV1bMjf5ntnpwz9kaD04KIpjR0LYoy
         t5Ky+I4vi9mo4WJ8lucIof1Cx3aBixtmy2uew8gN82rbCeH7WFL4MYtu1i6S9NN1z6hf
         dQrP6ZJu+O/wvnlHDys73uhLW4+ve2adu9/IiRkeEDmKKWgUl7/St2Op+kUmSiTtTpf9
         B5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798661; x=1796403461;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JoYlWYsc7qA+Bk9zv3r6KL/XVztnYAaVtmzSY0LmZ30=;
        b=JHY/AQvzJo0ohmgOUiaJttxDJV+YFb8v+LEq/zq3gPZlpflPpzhU4+KU3Wm5AXYNgt
         HCyeW7LffT384/XaP3a3tL9W+vlUIubl95wqLyl1AeKo6e5XCyDwHX9lnnUurIqe4Ka+
         KhQm23pEf7+IlXkDpVAqcaFbw+U0w5qGq0iGBPiIC6Ga/S9irCcvKUgbQIO8izVefAq4
         MesayYY5nFqR9aQXqWG1aMP2HEnQk8Lf2fteow2qAbyOKMs3qFOGf/HS04y5qXvCmQeH
         +PMEiCTOXqMmkLks+KFyzT8VXJH/xgAXXHSTby8UCki/5Ef1UMQx8rh8yxmesWTuZMYJ
         BDUw==
X-Forwarded-Encrypted: i=1; AL+hErFm5JwTR4ZNjmD63o157YA56/OmMa/jmI3yH3bI+1V7D2/jW/ZBC2YK2sB+wjeC8bmD7lGSwfHHXX6W/w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9beU23Gu7acM/9jzTSifBfx52+djDq5czLjNRHmOwW//kTn+ld
	nZBjImzsIHNon7i32Xc4nubQKhdpGFXl7W3GzFhdToLu454DbHWigc2tfIyc7NHDnyrb2I8zVYa
	P/s/Kas1EAq7k8J2ZIj1prcxuywb2utQ=
X-Gm-Gg: AZFdTZd3o9DpmU8M8TyrOWUDehIydMlsYWocUB6CgRoJBHNzlt7l7NvrZJe+aWHv7UW
	909bWOy6gOG3KdAZ5VYxWjz1Sn+JMLjdjIUVPPmBrfhAp66Rp9lcqYbwZ9cRupRCtX7K04rkp4Y
	4g9JfpKbxx/HxUCnAzDpo0cp6PXqV8F2D1qdFWXftYO/+68vGO43a5olP0Sw4un5KId0RoJJb+v
	QLC3KytEYo3gP60RUUSDJ+XCY+Ue7JwZHVFtt5Bsq3RCT9SYucWWQqy4su6btnWEk5yU8ew4+Eu
	GRMWvL7klwZhl9bq3/w60ZRz7YbanOg+3CMDL3gCs91tTtiQlwu1Tv+o81QWdiSUmR5nMJDgqdY
	jVyYXZ805NNHx/WWO3YWs1Ia7lYn1m+n0bEKh6uN4FKnuNolpgBCNQGPJXGSXj1oVYu8=
X-Received: by 2002:a05:622a:5a1b:b0:535:384d:68ac with SMTP id
 d75a77b69052e-55d769e9f2bmr449322421cf.13.1795798661145; Fri, 27 Nov 2026
 08:57:41 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
 <LKFsWplUk1yOr4M1dEHqZ20-Oo7ya-QA5qkF8u2lcfPUsbJYq0AoJhyjIEBwg6PPzlPSMYfqn6CB-sQBOuQDKQ==@protonmail.internalid>
 <20261127134507.125513-2-hikmahgumelar@gmail.com> <a8ee91a3-fc4c-4268-97c1-b4ddeff2558f@kernel.org>
In-Reply-To: <a8ee91a3-fc4c-4268-97c1-b4ddeff2558f@kernel.org>
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
Date: Fri, 27 Nov 2026 23:57:29 +0700
X-Gm-Features: Aa3M54oyapQeOF2CNR5heqj_kowOsQNp9ESIWcAwgObVTh4Yt2mT_qD_BbMY_SI
Message-ID: <CADA=zOPBRrzdST4rwNwejXF9cY8XJUFMXc=+FR5AQMiFFdKPBA@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src
 100MHz parent
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bryan,

Thanks for the review and the clear feedback on the commit message.

I will keep "leaving gcc_camss_csi0phytimer_clk stuck off" and drop the
board-specific reference at the end. For the rationale, I will note that
comparing drivers/clk/qcom/gcc-msm8953.c with similar Qualcomm GCC
drivers such as drivers/clk/qcom/gcc-msm8939.c, along with testing on
MSM8953 hardware (my Xiaomi Mi A1), shows that switching the 100 MHz
parent to P_GPLL0 with a divider of 8 resolves the issue.

Best regards,
Hikmah Gumelar

Pada Jum, 27 Nov 2026 pukul 23.11 Bryan O'Donoghue <bod@kernel.org> menulis:
>
> On 27/11/2026 13:45, Hikmah Gumelar wrote:
> > The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2
> >
> > with a divider of 4, leaving gcc_camss_csi0phytimer_clk stuck off on
>
> "stuck at on" or "stuck at off"
>
> > MSM8953 platforms such as Xiaomi Mi A1 (tissot).
>
> ah I see.
>
> "leaving gcc_camss_csi0phytimer_clk stuck off" you can drop the fragment
>
> "MSM8953 platforms such as Xiaomi Mi A1 (tissot)."
>
> > Switch the 100 MHz parent to P_GPLL0 with a divider of 8.
>
> What is the data-source you used for this change ? You should describe
> how you know this to be a correct change - the code is simple and
> describes its own change.
>
> For example citing drivers/clk/qcom/gcc-msm8953.c and
> drivers/clk/qcom/gcc-msm8939.c since they are very similar controllers
> and the 8939 does it the way you describe below. Also "it works" is
> another good reason. Inferred from your patch but not stated.
>
> More accuracy is required here.
>
> >
> > Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
> > Signed-off-by: Hikmah Gumelar<hikmahgumelar@gmail.com>
> > ---
> >   drivers/clk/qcom/gcc-msm8953.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
> > index 8fe1d3e42144..8aec5600e837 100644
> > --- a/drivers/clk/qcom/gcc-msm8953.c
> > +++ b/drivers/clk/qcom/gcc-msm8953.c
> > @@ -964,7 +964,7 @@ static struct clk_rcg2 csi2p_clk_src = {
> >   };
> >
> >   static const struct freq_tbl ftbl_csi_phytimer_clk_src[] = {
> > -     F(100000000, P_GPLL0_DIV2, 4, 0, 0),
> > +     F(100000000, P_GPLL0, 8, 0, 0),
> >       F(200000000, P_GPLL0, 4, 0, 0),
>
>


-- 
Best regards,
Hikmah Gumelar
