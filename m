Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C138538887E
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 20:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788553531; cv=none; b=nO3qcMrg2Ug3gLIgtgVgemOs2AjG/yVIhD68sJuuVg5pS+X9j51XMvA/0g8evx6vBeockKRhJL7XIjfRNuFXdcOXrKN6v+OMLTQXAvZ+wvGdfGglnIfW5LqWchS2D2n3ctrUylMpbGQ3hnG9stWaZiQi9o9ClAS7c/YbRIRf/HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788553531; c=relaxed/simple;
	bh=rGDlx5jbGgdtm25l0AcFBLqXSguwcQZGi2fDP8hQQnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W9RgpRoZu1M/+ylC1oYjeTslGFPJMGjme8LVVOtqQj5vgmEVQai9QzhZxY3KpSqQ90rboCbeL0F4vSBhKkPxsNvi+K8t5f8JQBM+bwSQiKRy9wsZEQguDctCQwH1qlOh57vVB7OgHamDitE4kDtLQ+ZIaSDLK7Et+iJpHoi/+CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EdZshfHU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EdZshfHU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BAA61F00ADE
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 20:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788553526;
	bh=rGDlx5jbGgdtm25l0AcFBLqXSguwcQZGi2fDP8hQQnU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EdZshfHUvpw4totxAt9Wb40sNlWFpMzGrq38mRlghEZRnKWzdFOcq+N/EDXqPbogM
	 Ev+q4vBSQ/0QcLA3rzJsbqt53Z8vzEZJ0jAiOY+0/f/KSlSIpS25F7KtLylDSEGVl0
	 MkH6AszgZ8sSs+TROYn5yBRXdFzZBAwtR56S3FVMTwr6FC/8WsWwYwn3uXJn1BB95U
	 J4Nf38fREV9webl67k70XoaQsQ/rEhTx3xq+sGxpBFTMWgi92oi23Z8GXuv6XsDTG8
	 EnizAD56tOOlqAm8vU/GkRvod4CiGe+JM/JaVLe0qn5CRvvqcc0WYkouJnrEPBn7Gt
	 NVp9IEniewl1A==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b4aa47bc97so1122948e87.2
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 13:25:26 -0700 (PDT)
X-Gm-Message-State: AFuF++mIX1b6jdmoAOFNEuvt9HDt3QSgKG4sG4Xfz13CHQSdc77K3Xoq
	Og48ZhHd8R3YT7hlvkuTobRx+602WCweyiH6Ro40zp3Zv2aDT3yJtALyDtkI4In1cyEslaKikv5
	JHChtQSqftNIRrMsRfkpDB6iERl8uFUc=
X-Received: by 2002:a05:6512:3995:b0:5b1:5a31:85fa with SMTP id
 2adb3069b0e04-5b616f422c1mr1440519e87.16.1788553525188; Fri, 04 Sep 2026
 13:25:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-27-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-27-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 4 Sep 2026 22:25:13 +0200
X-Gmail-Original-Message-ID: <CAD++jLmaXgmxkdRDL7PzfZSi=QGZ8xeFuQCDuojka73TzLrMSQ@mail.gmail.com>
X-Gm-Features: AcwNN1VFGVgp3BPlafVY_fnFdiIKFTejMjKFwtiNKEh6mV26Vuuqu4uuRQ_oTYU
Message-ID: <CAD++jLmaXgmxkdRDL7PzfZSi=QGZ8xeFuQCDuojka73TzLrMSQ@mail.gmail.com>
Subject: Re: [PATCH v3 26/29] staging: media: ipu7: Use v4l2_subdev_get_frame_desc()
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
