Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C5C43DA26
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 13:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528960; cv=none; b=WLAqKtO+AueJp5OjQkXRl7OyYWLr/zHsfCFETyEi7hS9urPcTvUNU2lkLnqFOsbiEeP/U8zx8fuSOa28yyKzhC4DwzEg/+WVp6G4rlLRCMKRCVmIyhBQDDKWeCYsqA5/ujs9VeCma/wV3fQGm1n7eGQjnwK1b3+J95AW09pXQg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528960; c=relaxed/simple;
	bh=4VptqFJ/x+aVLFZESbzB1oCUrwg0FDGKAhRIWlsfQ1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aEZtO0kybxQkG15Y3NBPAOsUyiqj3WcLj0LL3+8ipbV5TemA/loz501sNSR7YCzKYyhIzQvTc7UXOp8xj/rbfgKfSKF/2PfEiG8Yq2wCp8MbJIcLuck1jBtZous7wBWxKDwOOdS5ZOvlVIeV110vt+Y0oGuN4FxnOf5o1R2ai0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Plm/qxK/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Plm/qxK/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADBD1F00A3F
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 13:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788528958;
	bh=4VptqFJ/x+aVLFZESbzB1oCUrwg0FDGKAhRIWlsfQ1c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Plm/qxK/svuUFLDJboxqDhGdBAChaIHQ131/OzULQr4PSZye8COF80Fy1lKAEzPjj
	 RojbTMyj8DneH3OruU/l0A3Kl0YrCUEItS1X0Xkt7TCLV2guHklbsUs9sIYuk2+HcF
	 3MoRimrCtoZbMkkdb4NRYwpvHxrS5pQWN2bzeO5mw8I4GKF+T9WOjyLwnXlG5EopYA
	 /aoPlzakHhXQMalpMWWjuWuA5yEAC3tn7RJBrvJ2E9RGGL+H9htDVkC2fFoT66VPgu
	 +6BOn6syGV16G6wRYA6YCTDENwkCOphmYqnkRY/Q974fQC3EOqcSEzODa0FlrZtJC/
	 k8ec4GKXhINvg==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-45837e52d8aso768135fac.0
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 06:35:58 -0700 (PDT)
X-Gm-Message-State: AFuF++nY6ugp8pHPIlV/MOLWC6F+3dgbuwQxJrDtSpgVrAcAt+UBrT5l
	MJx2AaLZA39z9jaWWSwqZSpafU4VgwDZ18IoLuRGujc4XEbxxexmODN6dsnIEV0Sz2M4Nd9fM0Y
	1nhpIft+2X076bgTplvqXQkY64sWqpE8=
X-Received: by 2002:a05:6870:720b:b0:448:6c60:9781 with SMTP id
 586e51a60fabf-4754fd14f8emr6557210fac.6.1788528957958; Fri, 04 Sep 2026
 06:35:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-24-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-24-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 4 Sep 2026 15:35:43 +0200
X-Gmail-Original-Message-ID: <CAD++jLkY=9sXrgui3VKHekzN7g_W88GrWa5B-5D51qD+fFfzdQ@mail.gmail.com>
X-Gm-Features: AcwNN1Wh2NbHYdHMtC6OuFG4IAR463SnZgfyB_TqBD70cNsQaX2FNz_eiO7SJXk
Message-ID: <CAD++jLkY=9sXrgui3VKHekzN7g_W88GrWa5B-5D51qD+fFfzdQ@mail.gmail.com>
Subject: Re: [PATCH v3 23/29] media: exynos4-is: Use v4l2_subdev_get_frame_desc()
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Mon, Aug 24, 2026 at 2:15=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> preferred over calling the get_frame_desc() pad operation directly.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
