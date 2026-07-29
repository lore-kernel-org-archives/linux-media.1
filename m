Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FEB30DEB2;
	Wed, 29 Jul 2026 06:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785306633; cv=none; b=PSk6+rKVv3F2BSEszw+pfZMnF0b0mW5NShlYf4ScdRrB12b8NEsJE+SGz+lFsD3V/VxVARunMWVqjHJfwefHY59ObgzERjLYjyNPy+u3sJlULvqnZYkWX8+OeivC26V5eq255YgB5h+xXhKTBaJSaKbWyo/hfMDnIXRv5KX71IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785306633; c=relaxed/simple;
	bh=IW99dsyBptie4GVhEycE749gj6MVlyGLuDs9LGQ6SL8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AlqrfMzHKs5L1pE1k4x7kerswfF3uvgMEg5OUHnBT+uBO4yCM+cYuQGHVqfA/Kdyvev7aqApz9AzxUKdNYJsK64yllkyB/bjHGR4+4pB3r/5JXZ6COtizR0NadmkbLpq9ZPgdqTE2IZLxox5hPtDTdtHaVwcFcAS4OXSOB/TuvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvaD6bjH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvaD6bjH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54B81F000E9;
	Wed, 29 Jul 2026 06:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785306632;
	bh=yRoKZWJrDDQJWq9R+wTAnGnJOe2ZkvSdRtweOFAjt3E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IvaD6bjH8J/r18WHyMljIMN5ABzG1jLYcPDftTTBO+lLsn8adeHCfqCV8qFFteBna
	 hFOm+EubYQtZDQHkbssRON7/bQ/hDXMg90PBjc/fhJ56DjM+zgsrS5luHhjvJrwvrM
	 bAlZIUq+ZvX4gig3F+SeBqDZbv6S/YY2Dsd5mXYKdzdYbOk3WNTZ/cqxMDe5+9g9EP
	 1AitWHcrw/JEutDFiCz/sOd5nz4L7zEDVR775vwptl36/u/KrP9pS7JHu3MYDVn51Q
	 uE97fSYqeOACJSr8P51ch7sLxt3kqLz5R3sJvfIBmRk0Z6xUVRK//FpmyupH4ojiqi
	 bIgUEBqXIhNhA==
Date: Wed, 29 Jul 2026 08:30:26 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Cen Zhang (Microsoft)" <blbllhy@gmail.com>
Cc: mchehab@kernel.org, hverkuil@kernel.org, kees@kernel.org,
 rongqianfeng@vivo.com, axboe@kernel.dk, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, AutonomousCodeSecurity@microsoft.com,
 tgopinath@linux.microsoft.com, kys@microsoft.com
Subject: Re: [PATCH] media: dvb-core: add upper bound check in
 DMX_SET_BUFFER_SIZE ioctl
Message-ID: <20260729083026.0e26efff@foz.lan>
In-Reply-To: <20260722193719.81157-1-blbllhy@gmail.com>
References: <20260722193719.81157-1-blbllhy@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 Jul 2026 15:37:19 -0400
"Cen Zhang (Microsoft)" <blbllhy@gmail.com> wrote:

> dvb_dvr_set_buffer_size() and dvb_dmxdev_set_buffer_size() pass the
> user-supplied size argument directly to vmalloc() without any upper
> bound check. This allows excessive kernel memory allocation via the
> DMX_SET_BUFFER_SIZE ioctl, which can lead to system-wide OOM conditions.
> 
>   Kernel panic - not syncing: System is deadlocked on memory
> 
>   Call Trace:
>    out_of_memory+0x12fd/0x1370
>    __alloc_frozen_pages_noprof+0x2620/0x2fa0
>    __vmalloc_node_range_noprof+0x7fa/0x1490
>    dvb_dvr_do_ioctl+0x11e/0x260 (drivers/media/dvb-core/dmxdev.c:296)
>    dvb_usercopy+0x15b/0x360
> 
> Fix by cap both functions at 64 MB and return -EINVAL for oversized
> requests.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Fixes: a095be4b030c ("V4L/DVB (7659): dvb-core: Implement DMX_SET_BUFFER_SIZE for dvr")
> Reported-by: AutonomousCodeSecurity@microsoft.com
> Signed-off-by: Cen Zhang (Microsoft) <blbllhy@gmail.com>
> ---
>  drivers/media/dvb-core/dmxdev.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
> index 3c8bc75e4d6c..b4dc87945be1 100644
> --- a/drivers/media/dvb-core/dmxdev.c
> +++ b/drivers/media/dvb-core/dmxdev.c
> @@ -20,6 +20,9 @@
>  #include <media/dmxdev.h>
>  #include <media/dvb_vb2.h>
>  
> +/* 64 MB upper bound for DVB ring buffer allocations */
> +#define DVB_BUFFER_SIZE_MAX (64 * 1024 * 1024)

Having a limit is good, but why 64MB?

Can you provide me more details about the test scenario: e.g. with
what TV standards had you test it, and such.

Regards,
Mauro

Thanks,
Mauro
