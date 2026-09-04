Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E60509EF9
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 20:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788554758; cv=none; b=VnfcTy1ztQ+cJJukiJoXvDe25V3Z6uQfsNgXc6CSV002ce9SG82zLWghv/JrbnRW6p1FVr5OXhB1g5PEmNCX5W6TIXXmPpJGf9KkvkprHFbvqAZ2zFeQ2PpLi/dAQPLmhqPdVdiIzL0xMZ2oAmommqI5O7kadgIuJx0Yb0zn8fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788554758; c=relaxed/simple;
	bh=mpDWokbP0syXv4WLlO5WYFyj//3US3KmW6Yg0PT9fyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=syrZ+igtoaSPXuEYuzdZeni678BJF9V/jqXoznHqsCj0fcAX/+4gFHCMAXuIFglrIcBNvEUctYm0+rutuku2miCP3cnxCFdOjKr/LlJcCfeUKHUPBp7KaBTungGpawxrLyaplXiM13O8BJ1WjDRw+/5ERPPzNXZYI8uR9nx8huk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NbdRb87G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NbdRb87G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A29C51F00A3E
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 20:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788554753;
	bh=ZwP1h7vg5mcK60I6tMXgeleFqF5xpgFZLt8GpBOZoLM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NbdRb87GhU2p11IAwHmy5e/jr6aKp6qeukuB2IAWIiCKrPgzcAV5Y5JWH9LKS2g76
	 Ey9MDxWk6exuOMEy9hT8QL0nDFW+JfmR1sLfQcRW4OiurIzMXza+UVDtBGqKjFqTT/
	 KRnLRqrdq3DqsNZ/GcEf33t7o1dW0DAGsaVwBZAZd/j+Ryf9d2KIGHBSDbXlopQOF8
	 x6Aaw7NbKjvkfHXR+jyCUEtn5rWpa023OqkwkEY+FiBji81GVYEGDygn0hJF/nDgrX
	 Qr6UPwn6oP4j3rW/Wdc6PCd2qSTw8EBH9as/aNf3ginP3gIZst5uSRqOkRAgOIra7a
	 2mKp/HqOJE6hQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b568dae0e8so1110184e87.0
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 13:45:53 -0700 (PDT)
X-Gm-Message-State: AFuF++nwXfB79HJ04rlyrwCX9GdnXarvY6Op6hrmkNZwCynpoItl7/R0
	8ECGXGN+8CRFmvJ2M3b4Sery6/CurKt6L0iMEtBY8KAKfLrjENowOk3DhAjxunj3reCk8oZOK0w
	H/MZKNbXU2uRTLU/jzOaNmTSAhoQ375E=
X-Received: by 2002:a05:6512:acd:b0:5b6:1a7c:fd86 with SMTP id
 2adb3069b0e04-5b61a7cfdb9mr1083863e87.44.1788554752394; Fri, 04 Sep 2026
 13:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-29-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-29-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 4 Sep 2026 22:45:40 +0200
X-Gmail-Original-Message-ID: <CAD++jLnSoJU17-+sQshUtzSWL-TNrCKt=-jTuUUmoWpSQ66_8Q@mail.gmail.com>
X-Gm-Features: AcwNN1XgS8L0Pt_frej5kyG9nyQDUPV5zP3mHlx_2pwcLQrC3XH8GwRvqWNoLI0
Message-ID: <CAD++jLnSoJU17-+sQshUtzSWL-TNrCKt=-jTuUUmoWpSQ66_8Q@mail.gmail.com>
Subject: Re: [PATCH v3 28/29] media: v4l2-subdev: Use v4l2_subdev_get_frame_desc()
 for passthrough
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

I saw another thing:

On Mon, Aug 24, 2026 at 2:15=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

media_entity_for_each_pad(&sd->entity, local_sink_pad) {
    for_each_active_route(&state->routing, route) {

(...)
> +               v4l2_subdev_free_frame_desc(source_fd);
> +               source_fd =3D NULL;

It seems source_fd could already be NULL here? At least
theoretically, if there are no active routes.

Yours,
Linus Walleij
