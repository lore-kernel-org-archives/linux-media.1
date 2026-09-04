Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E1A3F2101
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 12:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526320; cv=none; b=qK4KS1G7OKDXHPg6FKAR/c7sfMrbIY/b5zscVQfkPQKrzAES9KgP9HMujMxHIwpP0iM0kcqPxshwBpHqwXhbk0Osx7accZ3FCwfhId7tnINYEPn27xBbd6oMY2dTdKCYdJErZjHEaxWxOqYg0naqFE3bBU6VXUX0vacWblCFaYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526320; c=relaxed/simple;
	bh=73Sdq5GDP8XNx1vL4EMRoj94I3e6N0gH9H6FKGAb5EI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L/8ZNl1bXJEfpzi0u0OTsoLUEtSfDFIUJBQnmAYK5wOgDWiYmho3pM5hRPn0lL0E+C9UQCcpdTdTyyfEPupsAKLEymV08/kf8KcR0Sm6jCia0zmIq0HOOD/IgCy1EOUmrIDw7VmbgtGaKOfQU8eJmNH10N3bt3fiBFOi/36QTGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVThOEcc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVThOEcc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D2A1F00ADF
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 12:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788526319;
	bh=73Sdq5GDP8XNx1vL4EMRoj94I3e6N0gH9H6FKGAb5EI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PVThOEccg/LXDM62MwbhgsnZ5olSeNY2zXWy1IoMWDFvx+eMkG58oeB/cA1qJjlTV
	 Rvfbq9d+6t3bS73vlHgLDCqu1KJAHoirj4CXDtbgMuLWXpO+zytWXqYm2HXEmvUkwW
	 SC8ONMNTXtJKGTJA0IL2aNqw9fsVXDaMRM/RPf5Yc/6Qi++TpK+srXMdlz6LNRq+1Z
	 JqSVnyxz3hx1JRN8Y0dQXsL3rC/K+ozgD6wY6GPxtn4Qpno0xUY9jLSPsYvZhHa/MM
	 hwfK6c8ihnkE/f/GFTktCxCx4Sxu9VwSnjZt3bhtZ3k8t6oytk0xfY0pYJ0A8on9te
	 lEijtI23DI6kg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b6188a2c0eso578951e87.1
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 05:51:59 -0700 (PDT)
X-Gm-Message-State: AFuF++lMbwOGSzBUN+MxdHb8l7YJjxhrzmKs8z2cjTc+2NXUjomAeeC4
	el/BIYFT+LNp+FXG3PpZ6EUMiWDsxtmEqEvT0rz0QKpr7kg4qb0EkidUJSX7H2gWMwEAoAeNUio
	9gRYmwAZJgyMvWTijau/t6bhNtb0tevw=
X-Received: by 2002:a05:6512:159c:b0:5ae:b91d:b2ec with SMTP id
 2adb3069b0e04-5b616f01b60mr1047765e87.3.1788526317986; Fri, 04 Sep 2026
 05:51:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-21-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-21-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 4 Sep 2026 14:51:45 +0200
X-Gmail-Original-Message-ID: <CAD++jLkaTRRAjLVzG+9DbeVP5eyzuFMc7_aQKeV2LdkERQ-HxA@mail.gmail.com>
X-Gm-Features: AcwNN1WVDZwq-6UTq5tNwH9dqXpgeKImiYAZviv8tbZbuYSJ7ft0hP1EyXKnB2M
Message-ID: <CAD++jLkaTRRAjLVzG+9DbeVP5eyzuFMc7_aQKeV2LdkERQ-HxA@mail.gmail.com>
Subject: Re: [PATCH v3 20/29] media: raspberrypi: cfe: Use v4l2_subdev_get_frame_desc()
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
> preferred over calling the get_frame_desc() pad operation directly. Also
> remove the workaround for drivers not implementing the get_frame_desc()
> pad op.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
