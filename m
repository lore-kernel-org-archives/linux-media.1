Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63403630B0
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 07:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787816719; cv=none; b=fhwJn3jrQb630SSEFDfeu+DiRKWvmYpdgFntFfqQqpVe5EMbmN74TWuQPM6U4bsDFf+C6TkrqQ8a42PhiL+XJ4IlWqTYSO6JFXpPlHihHFk+ESW0pCIy/WKCxEPoyiJ76po4J5BtdSKkPTTAzx06+SF7LdYNweavV+l6DouFjsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787816719; c=relaxed/simple;
	bh=aLuMNlLs47mH69e5/kSmU5uJHLTuLlHGEGYL4spGugk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pe6KXWCRwEuO84+ta1r43Gt4lyoYOU5cJzrRGsEFwuMtqMnKkoohPVmRgiIOGb+JjZdUmYb+kd5i1JdOYc1xfQbBoAsN19LqChxI8pV20Hd26/X7caqIWXqCakEBeXYWxxs2qyQLXZlO/TPZToXM3urP+JQOIcZQiNr/KSQNWRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlXtfHqM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlXtfHqM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBFE1F00ADB
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 07:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787816718;
	bh=oKhZbSPmrVeF0zNjEmZ2IcPmdR+WD0fmCyfyFY8Mxw4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mlXtfHqMATj88RK/fNwe/uSQq9Rk3tC7aimfpGAItriQ2nlJDQ3AC1tr0jDfzz+/e
	 np4edSqh/vNk+/aABbk+Zg2RwgDx/S5R/GnZ75R024eWB9tLnGwo+6rfSUNkmcYR+o
	 pbqKz8L+OKP8YlyAjRig53Iqca9ZdTwJWMXv3ZDGw6hldptO1NxwnCXqPisXWz5UK2
	 gu99u4FhrG1pQQ1kFzNdXdi8WSIzFK56AAhq7XVBEHZ08eqiYKZFFqtC0pTU+fq7eN
	 l68bMlcI+Nv89gpRJmBLzIMqXF6qD2/9Hm59fNqYHIRagYbsNJpiFw9odYAzlbgBWn
	 QOSHX0ZJ5dcnQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b4a0e5aefeso2124896e87.3
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 00:45:18 -0700 (PDT)
X-Gm-Message-State: AFuF++m3JgChf2qLl+PLdQghRHAaEK82Dp/8Ym/ZCU7RFeVX9zSPkcxA
	SvGwk7Qk8BypwQDCagv6kOg87tBBUPx3Jx+dtHwng7gGun6vnCjDNy2oYSthbaiy4hOV+upqWdo
	6eXO4JO3duOVLQFdE7ZSTi0C0LK2ZE+U=
X-Received: by 2002:ac2:5695:0:b0:5b3:e52:a005 with SMTP id
 2adb3069b0e04-5b4a9030d3bmr4581696e87.4.1787816717261; Thu, 27 Aug 2026
 00:45:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-2-sakari.ailus@linux.intel.com> <CAD++jLkMt3ztAHZta58coseqnjpHxLys1sjcR0fRmtC=-m97hA@mail.gmail.com>
In-Reply-To: <CAD++jLkMt3ztAHZta58coseqnjpHxLys1sjcR0fRmtC=-m97hA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 27 Aug 2026 09:45:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLmHzPxb+FCp3Tyu_p4LQtEGGOYJXr+sQF7y=CSHFrYwoA@mail.gmail.com>
X-Gm-Features: AcwNN1V7zT0GV8SQPwdalPDBObWgSkiNSebWuLkMnNqpiUCobzk_yvzE-I6z8cQ
Message-ID: <CAD++jLmHzPxb+FCp3Tyu_p4LQtEGGOYJXr+sQF7y=CSHFrYwoA@mail.gmail.com>
Subject: Re: [PATCH v3 01/29] media: v4l2-common: Add helper function media_bus_fmt_to_csi2_(bpp|dt)()
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 3:18=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:

> So maybe
>
> if (!info || !info->dt)
>     return NULL;

Eh
return -EINVAL;

obviously.

Yours,
Linus Walleij
