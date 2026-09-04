Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0445A474271
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 13:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529138; cv=none; b=eDWgOkg6OAcNwvYOvgW+k/ncr/kepM8rLg5bsfBf8CN76AYFTz7Ku0m9NEyrnNQmCwCGDFOIHMsagbM6BnxrqPr6ZxXaSFK5FamFHhdToQBkLiFRFpxVA5YZEXhacWSld/PNHrXOy7+Faz4jpZAn9XskrcP3Ev6dMMd7tST4tRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529138; c=relaxed/simple;
	bh=rGDlx5jbGgdtm25l0AcFBLqXSguwcQZGi2fDP8hQQnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QUvxA5hWqrC0qYpvjAetQrb/vgRHl0E1Y+yHssW0D0PkXrqiEZP5NavggTZMmvi32QDK1hMXFDAAzRkC9uu3DVOQh/1y1w9eibWkMU+jHc0j8EaT50SUIk1GCIsvfrBu/FgXFipv/Qs7R2mv1KsfmEBi/yvtsn0cc67702Ej5Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRxrP9Pp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRxrP9Pp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D7EE1F00A3F
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 13:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788529136;
	bh=rGDlx5jbGgdtm25l0AcFBLqXSguwcQZGi2fDP8hQQnU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CRxrP9PpWRY2J3e+NZzim8xf0ArMH+zQHtRrd2l/o30fy0zzRGyGZofkriy+SkEyM
	 8M1Al43RldhsSCm0ntiMKglaG2gejJhyvMtLN8/POG6+yphTKc/TQS99Z33v8gYg25
	 +qyoVfVI1h5kpsiCa/5QC2/9ff6+HyoWG+wcrzYvyespTh1YcDq2x21ffL/R/+x0Gp
	 d7k8KKX4jpHEGkR1R5569Ni2hu1g0kyEsFHWOXcnNwq2L13s2nqGSMVb51VA3v4Rv7
	 2JlMvGpvPGZpnNAQx1pRTKTrU207qrvzJCpDwxJCTH5/Ikzom6AXCYQkPG6QCOHq2E
	 xJG1Q7q9fdkfg==
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-46adf49ff3dso664290fac.3
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 06:38:56 -0700 (PDT)
X-Gm-Message-State: AFuF++n8D8sVSpbmJGaEiCzYEYuOrXzTmol76KBTesE0g68G2v9tmA4+
	46qDdtpCslXtOnVf9J1TxFCKWmqnecqnY4VsFVb/Rm0Jt352HV1iPOvt7SDzxQEw0OcbcIEXaWQ
	7qoR6hR35H8GgB4ti62VMb2IxUGmWX4M=
X-Received: by 2002:a05:687c:2381:10b0:475:a34d:1f90 with SMTP id
 586e51a60fabf-475a34d404emr1809249fac.39.1788529135760; Fri, 04 Sep 2026
 06:38:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-25-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-25-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 4 Sep 2026 15:38:40 +0200
X-Gmail-Original-Message-ID: <CAD++jLmzgAYk7L-KwW0CKabT34kJheNmWDsg88QtmxktPjxP5A@mail.gmail.com>
X-Gm-Features: AcwNN1VhcranVOr4zZ1HdT6CoIwsupTONWcbW_DVv94wzEzoz_XMObzm45W3ows
Message-ID: <CAD++jLmzgAYk7L-KwW0CKabT34kJheNmWDsg88QtmxktPjxP5A@mail.gmail.com>
Subject: Re: [PATCH v3 24/29] media: ti: cal: Use v4l2_subdev_get_frame_desc()
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 2:15=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> preferred over calling the get_frame_desc() pad operation directly.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
