Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A6644682F
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 12:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525925; cv=none; b=eyJnVRPUQCqZ7vb4mF20zxWFkHCqTbaFYCjD3SSBo4Cvx9TTRQz98Y9vL+I0Rsyses1OCFLs71d7tP6yIkRySviHjej8qZR61xW+Ei48qE550EZww83vMaee6DUxUCokO5iGBaXHHXKVxndGUFN3hlZlVkOOmlfLLQiV6+jGxos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525925; c=relaxed/simple;
	bh=4G58E/vYCytEUGQuqJ71sJ01VozcLHF4bOEC7g7EdkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ls0rdy4Pe1p828auaz+zIM3DlCAYAP5bL6aBSpmvUpMA7n3YczWbSkMcMOEzVciFt25ruX1co9eH37QxXTXyJaY8Kh4VNXnRp6862ebu+E4959b/sHUelhWbqYuQPizHcaKuDtbCtujJy66EA9FezlC+XeSGxPe8O5fBQEFIYE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h4OMMO/Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h4OMMO/Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF401F00ACA
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 12:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788525923;
	bh=4G58E/vYCytEUGQuqJ71sJ01VozcLHF4bOEC7g7EdkM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=h4OMMO/YakX9LYj4WKl+NoEmRX5NBGNexte3xzFuPcUT8L5PhdJR5iX0skZNZBwoT
	 n8Kp0Vy83aiEiaXTzNPGVlWYk2kw+QjuhJjfI/tqT2QGPI4aS/hP54bFCnzUcboDm5
	 81Y+RoiUDLbbgVxCIoZ/edtz6tawVCrv9hzMNyWO6wBDyBvtJl5dtiDZB9N7xJCGgz
	 fK7sn2CPfaYPJolM12SQfwjz+5SOHznkzHv2MxRUb6Ukvxl+zvNfTBOu2E8VC3yJSn
	 WSu4R0O6TrLWAzWSrtRl3CLl0TXqUyGMwUC0ckhhjWBS4CcT7Y/wkpet4BiaN4Zjeh
	 OIQCkTFft85/g==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b5e1340faeso850473e87.3
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 05:45:23 -0700 (PDT)
X-Gm-Message-State: AFuF++kEUbglDCMUT75Stm6+H7C/SAY4EaJpkZSQtjR/PVFH4wUx4cGz
	Vow3f8x7tbsVhmDA4STzpHb+tPjM9Y7HWCT0zfNgW25InWn5M/ImYfl0Hxkom6fdeqwUw7sH+cp
	kArWmx7cuTlg0k+HYU2SQ1MRl/B8S6Lg=
X-Received: by 2002:a05:6512:3d8c:b0:5b5:e2f1:e6f9 with SMTP id
 2adb3069b0e04-5b616ef21f2mr1289233e87.11.1788525921973; Fri, 04 Sep 2026
 05:45:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-20-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-20-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 4 Sep 2026 14:44:59 +0200
X-Gmail-Original-Message-ID: <CAD++jLmJUvYUSf0_TKPOW69UKhsEPRtO19=M8whkTnDHFLyOTw@mail.gmail.com>
X-Gm-Features: AcwNN1UwHtTZsNPyRvy29XqoCypIVf0BMKbh9oyomFYFX637fugYavqGIie-ScM
Message-ID: <CAD++jLmJUvYUSf0_TKPOW69UKhsEPRtO19=M8whkTnDHFLyOTw@mail.gmail.com>
Subject: Re: [PATCH v3 19/29] media: nxp: imx8-isi: Use v4l2_subdev_get_frame_desc()
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

thanks for your patch!

On Mon, Aug 24, 2026 at 2:15=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> preferred over calling the get_frame_desc() pad operation directly.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

This patch is affected by the feedback I already provided on patch 10/29,
that the i.MX8 crossbar isn't just selecting CSI2 inputs but also some
other stuff. Different "gaskets" as it calls it.

Other than that it looks fine.

Yours,
Linus Walleij
