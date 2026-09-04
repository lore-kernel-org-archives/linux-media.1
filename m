Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F05426694
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 10:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788517990; cv=none; b=GyjF76VMBQY+fTVkc7nYh98/w+6hE0impxNU76y4ZIgnNXrZ3bVQVHNDvdjiZky0dNbmopAw1BVIrUiXIgvW+2qnaz3ltvDFweyfa6cWE728FXvz1Bh6D0vnOiR/7gf2a/2wszKwPY6oSrPAjDGgPZJoBGZIDNnOOwLXQ6oBVK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788517990; c=relaxed/simple;
	bh=neCvWwIBkyKMYiZu8uKmTLd083+4AIJlVEvKKMKRyOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V66vHsjunVsTZD1tyTa2q4dwN9777dZe2H8n+jWmshPdTgoz75zMA7uJYYf68dXnoZ70nLeVgyzZnKMWSLJ4Ue081esvmsjdy5G20pgOeCVf/ak3GVInp3Ha5tazNIW7fDruFjOw6dqS4N7F6RxHa9hk8Av7Jn+hA6NffQ7I1DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/WRXlnA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/WRXlnA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3641F00ACF
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 10:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788517989;
	bh=neCvWwIBkyKMYiZu8uKmTLd083+4AIJlVEvKKMKRyOs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=G/WRXlnAI3rSMRy5JNGCkf6Kwl6mUvTn9XJqgIbLganDmSMaBfKsZ4z5V9aJKzuAB
	 I0iWKJcCVVr1rxKNzInoFZ+9/kZF5zJdFF/aqfO6A6KImCZlAiWf8wUUWEarK4vONG
	 cTcs+5Pj9H8c+s5VmxgPmXIJ/xIf73OYLwilQ6AGbbregRko+huAfrsjcaSQxKLwGv
	 V0EKyasHJ0Vzhm+AdupDusl2L2+qtr8QIHuD//xugvX6MI1hIJhJb9x3yjX26uh8JO
	 F56ipzuCziYdsasmGKMIcVEUlg9lMZWJFJUiNIyUpiW7E7dGzs6OfBaM8+OofciVRi
	 tRpCo9cKIqFrQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b4ac3ba821so759626e87.0
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 03:33:08 -0700 (PDT)
X-Gm-Message-State: AFuF++mRI7OYu2PectIDX/URxToP0pVCGgEhKHqq3PYDwlL0d65J+68B
	3YOEevKOHrp2esdpj8Wh8JP/4l7H1Cz+PBqnJmL2oLUOqJ3MvaHmODohwDFp1TngBrF1rFUJL5y
	pfjDTeRTUUcdsNYZQfXx/tJXW/gTj24E=
X-Received: by 2002:a05:6512:234f:b0:5b6:183b:d215 with SMTP id
 2adb3069b0e04-5b6183bd3cbmr548452e87.60.1788517987723; Fri, 04 Sep 2026
 03:33:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-18-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-18-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 4 Sep 2026 12:32:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLmY7H5ek3tDqQrSd1RyHC1EpUNCFnmXbQT4Q+OBTt+1Lw@mail.gmail.com>
X-Gm-Features: AcwNN1U3x-RwDkklKiX6k301Ex95P_CUHrbssE21IDNqmuM0XSVNRPDXP_KIUwM
Message-ID: <CAD++jLmY7H5ek3tDqQrSd1RyHC1EpUNCFnmXbQT4Q+OBTt+1Lw@mail.gmail.com>
Subject: Re: [PATCH v3 17/29] media: bcm2835-unicam: Use v4l2_subdev_get_frame_desc()
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

Apart from what Frank pointed out this LGTM so with that fixed:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
