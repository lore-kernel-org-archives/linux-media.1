Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93A7524AF3
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 20:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788553712; cv=none; b=uYuVp4jFZEIlwZtSb8HbtARRdFrpTiaCAJmZKxyD4PIltcjLKcZm3NGTylMSn1YuEqcIBwif9YgR+o/NqpsS/6/c65JonEXnCkPojWXm6z6+SvC0Ui5z5rBiBVQ6K9ovWie3fiyu9/3OoCDqO+UK7H7e/QRU2wxz3G2ETfecxIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788553712; c=relaxed/simple;
	bh=X0E4QJvSOU2dVn1giHq/7O9uVwyZrJJEFJz4PWor9iQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kt/+zoPqdfojjVlWWTLNjJB46rIEL0eUa+8foFLYgmW6vxPo9ZrR067iu/YqEly0shoSF7ewsskBbQJCFSSNHNUPeSL38EnOBl3+Wc5Y18kTnCNFkaJ+qM4CLyAEMOlmY3LIUbKw112RcLiluzzx5WbxsJNsawsHrwO9OeMs1Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3GBpl5v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3GBpl5v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A181F00ADE
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 20:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788553686;
	bh=X0E4QJvSOU2dVn1giHq/7O9uVwyZrJJEFJz4PWor9iQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=d3GBpl5vJEDGDkCKT8qXwvwWluSNvUXbeyJz/HnQM5ynBX1jaMEJNmtGd+hyr0P/f
	 itvPnxjj7Ffc/hn+neeD3zos85/jklMPnWSbKBXlSx1Ig8Fwyx1QM3CdlW/PFQSYjl
	 LWmNC5OoMY9o2nX+4kbsvRrkg58cFLmiVZcScHXp/6Y+mPu14B6YXXnql/2C+eCP5M
	 DcwOpo7F9MdiBiv5i8mblJtvW3AMa3CCUag1e1w/R20bqXQUc97fgocivepLxGJGl4
	 mqhcuDCODPO28eKAOsw21J++T9yGiN6iDXXPlzw1Aekg9dBZZfA5Bz7+4ueli/BbeW
	 HywHbXjnDuRZg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b457a0b4e5so1366062e87.1
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 13:28:06 -0700 (PDT)
X-Gm-Message-State: AFuF++mR8z012Sk+6GuSeCSvfszY54Xzh47ucUikpbPide55fCOh7AOO
	DLIHY2zdeZgtH8Z9rE0GV4rnskdXuTDe8BzNjQn0MffpyKqWEEAvq5vfxrXKd8vW/0aBNrdJNQg
	2guDyj+LXlsDrI+HTr1YVtHgO8wQ215c=
X-Received: by 2002:a05:6512:ac2:b0:5b6:4b2:de82 with SMTP id
 2adb3069b0e04-5b6170596d8mr1290711e87.32.1788553685143; Fri, 04 Sep 2026
 13:28:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-28-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-28-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 4 Sep 2026 22:27:52 +0200
X-Gmail-Original-Message-ID: <CAD++jLmAjEvpF8qmgHQuPaYMzXBhu8Bx8+GE0ZoVzdyNtzT81Q@mail.gmail.com>
X-Gm-Features: AcwNN1UISe0nEvd0CQSXE1n3ziMrRFNZdRzDttgtZjyeAHnZUMxYM_awI_hDRo0
Message-ID: <CAD++jLmAjEvpF8qmgHQuPaYMzXBhu8Bx8+GE0ZoVzdyNtzT81Q@mail.gmail.com>
Subject: Re: [PATCH v3 27/29] media: cdns-csi2rc: Use v4l2_subdev_get_frame_desc()
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

I have a feeling this might be fixing some corner cases in earlier
patches, but we can't squash everything and it's anyway the end
result that counts, so:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
