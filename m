Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFBB32E128
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 12:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265908; cv=none; b=fHX325VzVpEJfFCHVGO9T/ZD3hloytzJ3IMTUSfXlwUzYjXqzwa7+A4zQEMUZY4wme0nvOzAXfA6XUdMOJdcFXEOsxJQm4/fM9BDEKAMPIJ6KjC4pEX4s1t6FExJyDVW+Wr8i+8CMgtCS7OiZ5EAeE2kbrFlxx6GBhnK54IByn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265908; c=relaxed/simple;
	bh=XWyg/sGSiN9CWCJHl0G6U9SD6FigwnNwv2O6pdbZ2lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=btGS1fv837ws7FsknIRHI9bN90lXr5Qn2UUfwBJ76v3wFZyKYw67EK4/TlGczPynv7a+i7+/i7FisuI1KRYsj7QcKMqpLKPLuX6NXnSDJaR5dvh3msg2PUs2+Zzuj+3daEpnB7uycdni8vIHzXqenDyrRfL+yy0mrhtJg8j8jHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lUJ3VvHU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lUJ3VvHU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39391F00A3E
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 12:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788265906;
	bh=XWyg/sGSiN9CWCJHl0G6U9SD6FigwnNwv2O6pdbZ2lg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lUJ3VvHUDRZjfroKg5kmiKh0x55nlNST1kE8k7Gipa/51LGDA8rxuY+A5U+dCyg1t
	 pHNy2pAU5oYLoPcE388hH1DYKgoGrISDLP4e5Uy8xNbXwjtnKrYVDQOTXrL+XlqCSH
	 IfBfXvCU7LDZKBTY2UBZkHlBYUX8CzhEyVx9rKIG42zioNvw7tDx0/xVXhM6uSfCbq
	 1NZ3uerF44puJ+6LlNmsLwHl9g7eqPL+9zQmJ+iP80K/ANoTjk+GojChXgVug+F8lY
	 eM1/Br2v7Q5/8RmbcUwWbfDKuAt9al59midSGB5wQZc9Whd6UiXRmElfELEl9FKJYK
	 3VdlFqBw392Eg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aec6360133so1851973e87.1
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 05:31:46 -0700 (PDT)
X-Gm-Message-State: AFuF++k1lpv4qri6AFH3t4rCwdB92IpZTmbIXAr6r4GBFFmjlfnr2fFP
	I4/SluyK7yZb2LM0wzxU6rRq92ec12JFkW+JYKFDMJ3KYrn2FPtKOPfEOL6FB9i8hB1Ytc+a9Ko
	RSxaD9gZKbjnHcTnzLlrO0DXKw8JjrzY=
X-Received: by 2002:a05:6512:12d1:b0:5b4:5846:d925 with SMTP id
 2adb3069b0e04-5b6041f62d0mr717344e87.21.1788265905653; Tue, 01 Sep 2026
 05:31:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-7-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-7-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 1 Sep 2026 14:31:33 +0200
X-Gmail-Original-Message-ID: <CAD++jL=cGwb2YJHi+SLCAj=rXq+k-kV1cfteNu_ffCqA49fPTg@mail.gmail.com>
X-Gm-Features: AcwNN1XpaFs3y_ztQsD7_NRBj7b1zcBvMy4B0r4NWOmjk58WdD8vtJ1K3aS5KFs
Message-ID: <CAD++jL=cGwb2YJHi+SLCAj=rXq+k-kV1cfteNu_ffCqA49fPTg@mail.gmail.com>
Subject: Re: [PATCH v3 06/29] media: v4l2-subdev: Change the maximum number of routes
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

> As the frame descriptors are now allocated dynamically, allow as many
> routes that there can be dynamically allocated frame descriptors.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
