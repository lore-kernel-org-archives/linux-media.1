Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274A144682F
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 12:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526675; cv=none; b=eBd2fJ/lebQUlh3y+1RiQARPOut9yneDQkqjz6CilV7PMioM9REUXXFzlQ+jAHKpaDsQzTS6EeJSyMY4pZXFFvkbQHbSMLjVkwE4GqPyaFhTr+yPBxLOwWjyiDdRHog0EMyUvYuwgq6yNLyFxBw6ymWOiHlWVacDTuiSRkEO26E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526675; c=relaxed/simple;
	bh=vczjZZo606IaKWBIprklkGr1QBa0YeRaZ3QNQ4dDFFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ASHfry3PzC+ZDBBiUwzleTvAPhua66/5fUSo6uqBQtUwrpGpQYV8RWk2mC5sk9FpuuuOuVyvpgzdt3F01bNo0cHHdjCNSpOd2yr/ZeLIXVI9+N4wSwR1r/hOVRzc8xzkR5fDTLSaLDxTz6ZRlXV3+8t2ma4n1x6jR5znoPznksQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E7aMx7hW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E7aMx7hW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD601F00AC4
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 12:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788526674;
	bh=vczjZZo606IaKWBIprklkGr1QBa0YeRaZ3QNQ4dDFFE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=E7aMx7hWvJTN47+SRjleXTbD6NZt6dSKGcXuJDqbPQK9/yneOuPPpVVhh3l0JPpz0
	 8IFgRCtRxKmJ9Mb8YUAp4MWwHfvuxb/3Z4dta2/oBOmazKPmt3Bt5B0m2zpjG07X/t
	 L+1jbfC0NcK3fELZXWqwrdVAUBH+5wSynzmVe+o7CbYoGPxf0cHwNsMZIHd2/JP9P6
	 YtZwvRkMTZPRIIOHre1s5cEnn0LnqOF28+roslnGQ7a9L2CgdJMlvovLoIMaCx/PeV
	 In8CFjcEHSKWPumHaUTFDbw2xNpqiMf0b5gJqGlP6WohUUr6OUCtpEK6ii/3ZGEAeG
	 Zgyszozcjq3gQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b60bcf9051so863806e87.1
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 05:57:53 -0700 (PDT)
X-Gm-Message-State: AFuF++m11rPUFz2YONQcLjENF/KA2NhAB98LhS/a8pTDok1cjT765Qbd
	HzorlBQHpDVA5Eo1m/cnuzySOePP6sy+KLKV74gRFmIBmAxTCnzqdSP4OjfWV9Z+L/ADBF6lugU
	pwAoelPYEzJ0aCR5tijZnDsgrC76l36k=
X-Received: by 2002:a05:6512:3196:b0:5b6:425:4bf0 with SMTP id
 2adb3069b0e04-5b61706bb7fmr1610812e87.33.1788526672651; Fri, 04 Sep 2026
 05:57:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-22-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-22-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 4 Sep 2026 14:57:40 +0200
X-Gmail-Original-Message-ID: <CAD++jL=FjpuBRXFG311WD4_Mg9Odo05_ypi+zB6E9_7sQjU45A@mail.gmail.com>
X-Gm-Features: AcwNN1WRqQGUTE2mRFjH8Jo66YEey6h_T3wQsJnXqila2oLua61QzHwkwAUH1ng
Message-ID: <CAD++jL=FjpuBRXFG311WD4_Mg9Odo05_ypi+zB6E9_7sQjU45A@mail.gmail.com>
Subject: Re: [PATCH v3 21/29] media: rzg2l-cru: Use v4l2_subdev_get_frame_desc()
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 2:14=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> preferred over calling the get_frame_desc() pad operation directly.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Apart from what was already said in patch 11/29 (and you already
said you would fix) this looks fine, so:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
