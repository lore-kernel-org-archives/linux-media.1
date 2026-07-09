Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A6D3BED63;
	Thu,  9 Jul 2026 12:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600381; cv=none; b=ZZMfvdBpDYPS6HBxP8xtz5uIims+uazta5gk1y032UJqLRUR4Kp/eSk/pm8k/ndQtkj5sJUbkZwmwI38oNpDsQo7be0rvQE8TFTYMl5cq++C+dBTCFuz3izqtWs/qYzh1RLnm0/4SzN4FZbsniOQrK717z1eBFkWAwSVD0qjFMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600381; c=relaxed/simple;
	bh=D/91n6+nYj/UVmCFWW79SAONgyBaNJJl5h2fcYUuJKg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LAmG3ie/UfjUYKb/ajfZZmaZ1udf+HmMqvtWT0Rc16yWzUsJ/DDZksJ3N87Qtj51D8AT5N5KrDvkyo21VyjzYy0zwD5xpytYIzTCPgRpvCl+ytFTB0+EfY+h7qgTWAUQ7uwPR937nNp/4LwBqTowGxLuMJ5hnBTWR9jcstYb8m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gdFh8VX7; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gdFh8VX7"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gwvWB6yxNzKmyt;
	Thu, 09 Jul 2026 14:32:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783600375; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YVYt+UStdsp6KSy/K/PPDXZMCGokRgp9VCy0kpFdPoM=;
	b=gdFh8VX7SzGhmQ7SHfO274rZcpjmyjzdoawdIUQozbFTeA/8X5xbhrVIaYJJ8cSaM4stqb
	XXltG7AAq4u7ii/krmysiaGXk/jKpVXZ14B8G4yKr5rG3NlUnjSDv6t93ZFAW5bBpbcqap
	1cvI6v1qQ7nOGzmY5CO4b7QWPjRNra93fN1BOiIJkF1dembWqIK40jLqlqYifGZPmISkaC
	8707rqIwuJmEZ4+5Cffxpi78avEFeb7fE5DiAXiFzijozmpnvLznDzFl7wDS3CUrxpwPyD
	6WCnIYOHKRP211+5ZGTWVNwTC9GsVR3sd6SsQYTTrUCEUNm7oO6iruk/6BhlLg==
Message-ID: <1ccfc0b5d1696a8dec4756b675294e7fb41ab5ff.camel@mailbox.org>
Subject: Re: [PATCH v2 1/2] drm/drm_crtc: ensure dma_fence_ops remain valid
 during device unbind
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, Philipp Stanner
 <phasta@kernel.org>, Danilo Krummrich	 <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Peter Griffin
	 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Juan
 Yescas <jyescas@google.com>, kernel-team@android.com
Date: Thu, 09 Jul 2026 14:32:48 +0200
In-Reply-To: <20260708-linux-drm_crtc_fix2-v2-1-cf72be75d75a@linaro.org>
References: <20260708-linux-drm_crtc_fix2-v2-0-cf72be75d75a@linaro.org>
	 <20260708-linux-drm_crtc_fix2-v2-1-cf72be75d75a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 9kkhdaab74g8d318nt6ektw8founsbd7
X-MBO-RS-ID: f11a675c1421234383b

+Cc Danilo (who is currently concerned with drm_device life times)

On Wed, 2026-07-08 at 16:22 +0100, Andr=C3=A9 Draszik wrote:
>=20

[=E2=80=A6]

> Link: https://sashiko.dev/#/patchset/20260618-linux-drm_crtc_fix2-v1-1-c0=
3e77b36f34@linaro.org?part=3D1
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

I am tempted to think that this also needs a Fixes and needs to be
backported into stable kernels, doesn't it? Especially if the BUG_ON
disappears in stable kernels.

> ---
> =C2=A0drivers/gpu/drm/drm_crtc.c | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 63ead8ba6756..d55f1377ec36 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -501,6 +501,12 @@ void drm_crtc_cleanup(struct drm_crtc *crtc)
> =C2=A0{
> =C2=A0	struct drm_device *dev =3D crtc->dev;
> =C2=A0
> +	/* Ensure our dma_fence_ops remain valid for an RCU grace period after
> +	 * the fence is signaled. This is necessary because our dma_fence_ops
> +	 * dereference crtc->dev.
> +	 */
> +	synchronize_rcu();

nit:
I guess this is the only place where one can reasonably put the
synchronize_rcu(). But I would hint at the RCU delay in the function's
docu.

> +
> =C2=A0	/* Note that the crtc_list is considered to be static; should we
> =C2=A0	 * remove the drm_crtc at runtime we would have to decrement all
> =C2=A0	 * the indices on the drm_crtc after us in the crtc_list.
