Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D5E3C942B
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 10:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740910; cv=none; b=P24GovcT89uH9mH5dlyowbWPMp5g3mGwRHakgaMfVT9+IOr8Vcsu3uRXeQirVkZA1dWDQatHBg8AUuNmV0C/a3/VkJC0nvb/5aqF6t+kFzFrcGg32oUolGdeWWQN+qFkaWk3ILxgdU8dZ0pfUiT/uQ4DnmROPD6jsDPz5ZMQyX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740910; c=relaxed/simple;
	bh=VqRBMoZNcNZ2C/wdFD7vSU2Xs5RrPpT+CvL3sh2NTpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fjzvQJ0ti+//g9A0oOh/YhDYTBOxLzPV4Ze1RCJx4FhwYmdCNBpl4kQ7I0VCXmrUqx/2ThQjzhq8ScAPtFcmvPc0UyTMzrE0qzTbLQngblDIF8lUloj5monR7u0liO3IE8P1/pcjILHYRMBSQ4l9qIfJE/lvIWy32SInlrxsj5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bjm3hlym; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bjm3hlym"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F46A1F000E9
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 10:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787740906;
	bh=GOKm8u/Zj+T/6ykjQWpA7SjgKqZgQpDgrtISmnOCjrc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Bjm3hlym2PpI2CWmz9w/494AvHsc+sk3IUFGIjAVS+IekEc01OEe6yNPx0fySWP/6
	 xpizdEr4n+YpXDPrQEqnSHi0QIJ2G3TFyOww6c3B/WcTuxACSncHn5bnmeQQfXQYRK
	 tZcn0O5eWswInuKKsMx9Crtq/HYbEihzvpBGLSvnuo6lEblmpJ5tVfRWj+QOR/KHWL
	 dwKSQYcFkQdZZwJFOL2iK7YwK8+6JT/dKF2fUviXD7Dzil+HInzqEkfDYZTEf2ACVY
	 NQ84+svA9912SbOolWnAwvnU3fC7OJrO0aOML9tSLB1Kce5p6EMDBO+shhdlVTM+SX
	 bdCitujMPVUhg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39c9bb9d2fbso5759551fa.2
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 03:41:46 -0700 (PDT)
X-Gm-Message-State: AFuF++n5D//MkWJBaZC3rr6PgvVA6c4wnEhtb1escDwcrx4Ie8tkPBmv
	NMS3LZs7yGWpeGgBd/zcVmVboEcfNwkUDR6yDZwdTpL2VbWK8AUiCD8ZlZrzCSWuLS2XWLj4ekU
	VJZPO2Rr04/gEkQx+ybUeom28ej21ZIw=
X-Received: by 2002:a2e:be2b:0:b0:394:635:70b1 with SMTP id
 38308e7fff4ca-3a1fd443cb6mr13763521fa.3.1787740904782; Wed, 26 Aug 2026
 03:41:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825203553.3725132-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20260825203553.3725132-1-sakari.ailus@linux.intel.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 26 Aug 2026 12:41:00 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iavt9xmvRufb7jq2F+gdgQCbuf2kyNcs5EpUfh5nwA1A@mail.gmail.com>
X-Gm-Features: AcwNN1VdT4w-4BQ_0pgSu359vH0Qde0rXBkD0-3VkoCMWpmn4TvguORewpTXLYs
Message-ID: <CAJZ5v0iavt9xmvRufb7jq2F+gdgQCbuf2kyNcs5EpUfh5nwA1A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Fix static analyser and compiler warnings in int3472
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 10:35=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi folks,
>
> The two first patches address smatch and compiler warnings in int3472. Th=
e
> third patch clean up GPIO parsing in the int3472 driver.
>
> since v2:
>
> - Drop the __free(ACPI_FREE) change.
>
> - Move ACPI_FREE() earlier in the function and save the object's integer
>   value into a local variable.
>
> - Fix return values -- 0 was returned by v2 in some cases where 1 was the
>   right value.
>
> Sakari Ailus (3):
>   platform/x86: int3472: Address Coccinelle warning on an error print
>   platform/x86: int3472: Fix uninitialised variable warning
>   platform/x86: int3472: Clean up GPIO parsing
>
>  drivers/platform/x86/intel/int3472/discrete.c | 51 +++++++++----------
>  drivers/platform/x86/intel/int3472/tps68470.c |  2 +-
>  2 files changed, 25 insertions(+), 28 deletions(-)
>
>
> base-commit: 56c29fa3ee666197516a231e75aed789ae9c530d
> --

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

for the series.

Thanks!
