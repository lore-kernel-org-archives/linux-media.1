Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B459137DAA2
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 07:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787816797; cv=none; b=WVsVpk5d2gmHDV5BJRADrzrSGIYFUkEg4aJz1ERMui8aPR0MQsFdXQAC0cMTkAYDU3tLy954hjx08xlzTqAuv6ALSoqYBNiGMZw2NWhKMI/pWDZqc87+I3HTidOIRk+PmjPRXURI9grKbCl6SFFLlmRDzCSadhdu8g9I6y4Kwfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787816797; c=relaxed/simple;
	bh=QnxZAkL8FxeAHMMtrd0VQU8cdSvzOC21CVlsmHCZSI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPJGuwjAqdNZCokQ74D808Ln1giE8xuERb3+XYzAackkg8K+TjO6jYYG73TDStt2wF0AGBuzcGgtaZ0/94EjgiOXnPmX5nwRQzX8ezpIHjIEp30q0nBj0P6iv2N8sYkR/4FWQb9Np1yp6HzN0usvxrztdUhEnlu3MOWyt9cO/G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NoF+zERW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NoF+zERW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2671F000E9
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 07:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787816795;
	bh=QnxZAkL8FxeAHMMtrd0VQU8cdSvzOC21CVlsmHCZSI8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NoF+zERW6g9h9ZVt0QQxibF8N9ZwubkQLW411HjjTTtKk3OkEG1aTERhJAJSRagG2
	 KiXF5UmFHjjB1ZugamBn+eu0/rmIT4y928wUCDWNq10OFBY0tliI3cD613fJuRX1YY
	 291ch60rjPwVrFcSmzuUOJbYtOcpG9clxeR33GIUb0ce8JiJSN3NkWkNHsCzIw+wWq
	 0TuT7j8j30eIAympSDLTP5t6C5j7/aopD0S56eKeocHLJrQOOYh6F03Z5cNOYmyP0q
	 JGnJslpMxgzNCxa7bE/l0mqYb/5uQLSGk/wfYQN7Cy+eFnI9rxNl6ZlGCmvunkX6PS
	 itg6pFzZ+14tg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b14d1f9315so1437997e87.2
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 00:46:35 -0700 (PDT)
X-Gm-Message-State: AFuF++k/tmnD4iRHt+4rVr40zgw6LlikW0azGg1GhZBqrDik1S+7FAi3
	mIaykUiZ1leLv/5TjxfY+Ans7bQZ2JQPsk+8KckF6ROoPrtOPqVq9QXZdxjYrA6T9KLVC6ar3O/
	IHjGoJpppyTSg91J/hZHQj1HgexZVpmw=
X-Received: by 2002:a05:6512:1447:10b0:5b4:7795:8abb with SMTP id
 2adb3069b0e04-5b4a9010708mr3196713e87.7.1787816794071; Thu, 27 Aug 2026
 00:46:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-3-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-3-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 27 Aug 2026 09:46:22 +0200
X-Gmail-Original-Message-ID: <CAD++jL=awU4ObE2RTPY-sZx06LFrXe0MeDtzwXevn_t54O2q_A@mail.gmail.com>
X-Gm-Features: AcwNN1VbJgCRP3gOs7gap5RX5qQNl8PLd2FUy-z0Esze4IqRqTyRFi-CiL1OACQ
Message-ID: <CAD++jL=awU4ObE2RTPY-sZx06LFrXe0MeDtzwXevn_t54O2q_A@mail.gmail.com>
Subject: Re: [PATCH v3 02/29] media: v4l2-subdev: Align frame descriptor error
 codes with routing
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

> __v4l2_subdev_get_frame_desc_passthrough() returns -ENOSPC when there are
> too many routes. There's a subtle difference when compared to -E2BIG, but
> -E2BIG can be used in this case as well. In practice this was unlikely to
> having been ever returned from the kernel as things currently stand.
>
> Align the error codes with the routing IOCTLs.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
