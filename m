Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77ED364038;
	Tue, 14 Jul 2026 10:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784024899; cv=none; b=vFUzZ587j2YSEs/SxY6wLDBtAdSqiULoUxZGMiXykTnrv0M7sWUBEk3BNA8VRT1EC+hm0HhxBWZjCi6L6KgHeFlGHsYmDOgJVEnEY8dh0of4lAUnkginLN++g4xBmjjgHO3eta+EDnhlKieBOAUc//caCkN2ZEX6bl0gpFzg6M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784024899; c=relaxed/simple;
	bh=Z7jMdt1lQgWD9x0ibyUtxdvDazVsQ8MyR8kjqNUtrQg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L9AQtCQNRhuNMYj2bGz7s4G4HV3ZnerAS5lxkr+Lb+GkVG3LptglKrvM2hp76EY1q1TeY10kI5hxb1fIOV+ueXAsaZllXlzNKKFCyI4GklB9MW+Ork1q8Nd2SLuGWPgkqzsW/D5BlCFzh0kl/eRnVk6iTjAX8reudu0XrGqSjZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf19.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 52E45140308;
	Tue, 14 Jul 2026 10:28:16 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf19.hostedemail.com (Postfix) with ESMTPA id 0249E20025;
	Tue, 14 Jul 2026 10:28:13 +0000 (UTC)
Message-ID: <54ae65ff1286e2192b5a6575277e347469d4c44b.camel@perches.com>
Subject: Re: [PATCH 1/1] checkpatch: Deprecate V4L2 pipeline power
 management code
From: Joe Perches <joe@perches.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-kernel@vger.kernel.org,  Andy Whitcroft <apw@canonical.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	hans@jjverkuil.nl
Date: Tue, 14 Jul 2026 03:28:13 -0700
In-Reply-To: <20260713161327.3682-1-sakari.ailus@linux.intel.com>
References: <20260713161327.3682-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 0249E20025
X-Stat-Signature: xmfec7spatuo1g4zktew886tzq6c3whk
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19uIil6KtO762kAvDjb7kuZQ2NReEX9XDE=
X-HE-Tag: 1784024893-759597
X-HE-Meta: U2FsdGVkX18uLo1E7NDu02dPHgMGPxA58yQwfLZhNdnkIVbjHU4EXvX6M64+Gn/XTMmB35YKl+Pcz8vrFkDOiz8W9amiNwlxSQusrC3YjmYO9bxqgO1il6j3BO6mk/OouwbhfUsEWX8T1h+4XKBv1RdE9Pm84KUfmK3+o3iWyxndo8BVgFA0hS7jxIyQaQEf0rlw2nopgWIgDe/VazmIsE66LQspfMUyGGva+jvQGYJo/wNsmRAqNVxEEY612mktz1mGZHh/N9bDLqZllX/889z04LfI2Op6bf0A0isssdxthsx3QpaCP4a8a6SAUsYV

On Mon, 2026-07-13 at 19:13 +0300, Sakari Ailus wrote:
> The V4L2 pipeline power management code, in particular
> v4l2_pipeline_link_notify(), v4l2_pipeline_pm_get() and
> v4l2_pipeline_pm_put() are deprecated and shall not be used in new code.
>=20
> The drivers need to use the Runtime PM instead.

Nack. Say that in the error output.

Given this patch, checkpatch's message would be something like

"Deprecated use of 'v4l2_pipeline_pm_get', prefer '' instead"

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -879,6 +879,9 @@ our %deprecated_apis =3D (
>  	"DEFINE_IDR"				=3D> "DEFINE_XARRAY",
>  	"idr_init"				=3D> "xa_init",
>  	"idr_init_base"				=3D> "xa_init_flags",
> +	"v4l2_pipeline_link_notify"		=3D> "",
> +	"v4l2_pipeline_pm_get"			=3D> "",
> +	"v4l2_pipeline_pm_put"			=3D> "",

Add something like "v4l2 runtime power management API" instead
At least point out what that is.

And in today's '-next' there's seems to be no indication in
documentation or code these calls are deprecated.
