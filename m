Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6344E3BF665
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 22:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784153438; cv=none; b=RHUQF72ZQRHjguTq8fWVbi9jlvaBXX/7FoAKqGCJd38bWZWVhaiUL+15u0Yn6rNw/HhYSJxDXVsXMSmmwlcYABQemHT82mREWB+myBHlC1hwp4+KsP9AsH05sEypMd8wOx8mn0sV5Pzmu6q0DqbGSvz4GrDlj6NpXv4GcoDMPkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784153438; c=relaxed/simple;
	bh=xJw0Nto5bU/cgpO8Vn6OLzoD8RBRGpnIlnLln0opxco=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UbgwgkHMzTutVm3GPCxlK7EAW7aW6Ri1/0AIATfev3Nctmb4QbJ6kOAyT9USy1QrRgmzCZIf2aRQeG7Yqm67wVbLpFffvp2DIRNu0L+iVqfTAMF2lZHL33GBnp8WuW/ptUWDSvsyHueUGBHdykb29GovDm38sjMiQOzFf1RTPKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=mF8tlPv3; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="mF8tlPv3"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bf95ade656so1004327e0c.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 15:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784153435; x=1784758235; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q4kEZCTd78m2geHRQqGAMbXsi9Am32f1UzWUukaLkwY=;
        b=mF8tlPv3x7ZdSaJAFhJ7gONajQW/FSybZXCVDiJI38oBcsRlAoklXeMJPGI1wsmnME
         KQdUvWk8fqeP1oAAG6d1b68tup1fTQymLAK3a4U7WwWdGM6+wFFXSwFGNzJAPBXlBAYR
         sNrjIoBSstL5ja4qYce1B9udDCgMmaSRxqW07w18IlDg8d+sFy7gec/nZoWxgTk1s9u/
         oZaAWvSggYT5koAvjBVRExJsgmk1gxbhK01LGWCsu8ncenkaXeIaUozvQQgfSbsQc2r2
         5MDhn+/+cXgC4MHPrx9J2eHYxxrHqCFLoSwpPKGGpt7xTfC/deePEOgHPEpdLgzoVGtv
         sGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784153435; x=1784758235;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4kEZCTd78m2geHRQqGAMbXsi9Am32f1UzWUukaLkwY=;
        b=rXSV202ZTYdxWfEMJIs2Y9A3IDgxDhZ27uHNQEnInvL2/YDnsIDhi3YE8AagYhXaWX
         ne6w4IFPsrXLObVmObLPVKImghSaaY6QDfk/j+olYuXH319/UuKl9a3BqVnqohkFSSyW
         3cbhe5jcJnIA1L7kZDIhtu2c5wdUjaSYgmP03Cq6Dd6qsMUNHYmnJKKzhlOoNNxfUm6X
         vrUa2WD8HqHckS2a5Jp5V5pYEiRx4bfye9/8DTQFJu7ZEsTgGj7oXKaSEqGxtbqb1YR8
         0MlTN02xlVYWslr9ydenjmDZbJodghnzNo0HOb/bZ16ahRgG+rKAvOMdAIfDop3o3a4F
         qa0Q==
X-Forwarded-Encrypted: i=1; AHgh+RoYec31x6wkKPtO3eI2E+t7yXFkEvGZJAUryFm8T8qtIvIrYVktTbhHBl4LEIZ8iZhPO5ncvYWVCXqDqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg2cUNInvyrQ768SPIjNspVHrwB4oCdi8pVK94QgfPNIwQn/co
	D6fXBogEEs9QDXfGBXdEL0QhiBgS/8GhWZjuzOWj4dv3q5HHRXNXsVsEqLG4mB4yJCOPuJHn6I7
	K92sEvXQ=
X-Gm-Gg: AfdE7cmHw77gNXji0JpQ5Qjq4/W5X/oGCVS2x29Pmr2yTs5zvE0qIaOTiyYpHiOvmgp
	1Xk29T5Lh9BKL14TV72mDf/mij94sRO6gJ3RfUASB4narL/DRJiy43uWqIY4MTYAj0kXwT/6n5R
	68feHdaLMQa5bitLkHRlTaOnfozWo2BYZt2Fw3nh6JgALcy1Ok/ehRteTcQ4TRN6e9jFJwpHesQ
	QCSbRbmCxWWhFwyYupaL6TvhHT9+3QhJU2NBQtS60hTzAg+eFAcpe9H1h6JjGuobrJWgNQiMAh6
	2XfV+/Dxpqgkp/qtJMIHcksdhzA8ZqGaZlan9edQsd+6wEZHHslzk5YLNuHuyUTYOYI2RhwLsJx
	icerFTAMskDXuy8j0kgXfF8S86YPDx/W2Jfuz+WxBYjhrW5JDqW+Km5daKD0NCm+3zrkzP9cvbm
	Zm34NMQK0=
X-Received: by 2002:a05:6122:c81:b0:5bf:7f98:9657 with SMTP id 71dfb90a1353d-5bfbf213560mr11139141e0c.6.1784153435093;
        Wed, 15 Jul 2026 15:10:35 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f68d099sm14326742e0c.8.2026.07.15.15.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 15:10:34 -0700 (PDT)
Message-ID: <5c641e4c6890bd84c7abd30546b4ce701dd5a269.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 1/6] mem2mem_testdev: convert to the control
 framework and v4l2_fh.
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org
Cc: Pawel Osciak <pawel@osciak.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>
Date: Wed, 15 Jul 2026 18:10:32 -0400
In-Reply-To: <903c0da0d6e7354d6f884f0ddec783143165e54c.1342699069.git.hans.verkuil@cisco.com>
References: <1342699224-12642-1-git-send-email-hans.verkuil@cisco.com>
	 <903c0da0d6e7354d6f884f0ddec783143165e54c.1342699069.git.hans.verkuil@cisco.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-eHMy1NkGu+2JqlsNyjmX"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-eHMy1NkGu+2JqlsNyjmX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

see comment below ...

Le jeudi 19 juillet 2012 =C3=A0 14:00 +0200, Hans Verkuil a =C3=A9crit=C2=
=A0:
> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> ---
> =C2=A0drivers/media/video/mem2mem_testdev.c |=C2=A0 234 ++++++++++++-----=
---------------
> -
> =C2=A01 file changed, 83 insertions(+), 151 deletions(-)
>=20
> diff --git a/drivers/media/video/mem2mem_testdev.c
> b/drivers/media/video/mem2mem_testdev.c
> index f08cf38..a1d5c15 100644
> --- a/drivers/media/video/mem2mem_testdev.c
> +++ b/drivers/media/video/mem2mem_testdev.c
> @@ -27,6 +27,7 @@
> =C2=A0#include <media/v4l2-mem2mem.h>
> =C2=A0#include <media/v4l2-device.h>
> =C2=A0#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-ctrls.h>
> =C2=A0#include <media/videobuf2-vmalloc.h>
> =C2=A0
> =C2=A0#define MEM2MEM_TEST_MODULE_NAME "mem2mem-testdev"
> @@ -101,6 +102,8 @@ static struct m2mtest_fmt formats[] =3D {
> =C2=A0	},
> =C2=A0};
> =C2=A0
> +#define NUM_FORMATS ARRAY_SIZE(formats)
> +
> =C2=A0/* Per-queue, driver-specific private data */
> =C2=A0struct m2mtest_q_data {
> =C2=A0	unsigned int		width;
> @@ -114,50 +117,8 @@ enum {
> =C2=A0	V4L2_M2M_DST =3D 1,
> =C2=A0};
> =C2=A0
> -#define V4L2_CID_TRANS_TIME_MSEC	V4L2_CID_PRIVATE_BASE
> -#define V4L2_CID_TRANS_NUM_BUFS		(V4L2_CID_PRIVATE_BASE + 1)

While reviewing this:

https://patchwork.linuxtv.org/project/linux-media/patch/20260526122205.1019=
913-1-gdool88@mju.ac.kr/

I notice that this control had a weird (low) offset mainline. I've tracked =
this
to this patch, which moves the controls from V4L2_CID_PRIVATE_BASE to
V4L2_CID_USER_BASE, with no mention of this change in the commit message.

Nicolas

> -
> -static struct v4l2_queryctrl m2mtest_ctrls[] =3D {
> -	{
> -		.id		=3D V4L2_CID_HFLIP,
> -		.type		=3D V4L2_CTRL_TYPE_BOOLEAN,
> -		.name		=3D "Mirror",
> -		.minimum	=3D 0,
> -		.maximum	=3D 1,
> -		.step		=3D 1,
> -		.default_value	=3D 0,
> -		.flags		=3D 0,
> -	}, {
> -		.id		=3D V4L2_CID_VFLIP,
> -		.type		=3D V4L2_CTRL_TYPE_BOOLEAN,
> -		.name		=3D "Vertical Mirror",
> -		.minimum	=3D 0,
> -		.maximum	=3D 1,
> -		.step		=3D 1,
> -		.default_value	=3D 0,
> -		.flags		=3D 0,
> -	}, {
> -		.id		=3D V4L2_CID_TRANS_TIME_MSEC,
> -		.type		=3D V4L2_CTRL_TYPE_INTEGER,
> -		.name		=3D "Transaction time (msec)",
> -		.minimum	=3D 1,
> -		.maximum	=3D 10000,
> -		.step		=3D 100,
> -		.default_value	=3D 1000,
> -		.flags		=3D 0,
> -	}, {
> -		.id		=3D V4L2_CID_TRANS_NUM_BUFS,
> -		.type		=3D V4L2_CTRL_TYPE_INTEGER,
> -		.name		=3D "Buffers per transaction",
> -		.minimum	=3D 1,
> -		.maximum	=3D MEM2MEM_DEF_NUM_BUFS,
> -		.step		=3D 1,
> -		.default_value	=3D 1,
> -		.flags		=3D 0,
> -	},
> -};
> -
> -#define NUM_FORMATS ARRAY_SIZE(formats)
> +#define V4L2_CID_TRANS_TIME_MSEC	(V4L2_CID_USER_BASE + 0x1000)
> +#define V4L2_CID_TRANS_NUM_BUFS		(V4L2_CID_USER_BASE + 0x1001)
> =C2=A0
> =C2=A0static struct m2mtest_fmt *find_format(struct v4l2_format *f)
> =C2=A0{
> @@ -190,8 +151,11 @@ struct m2mtest_dev {
> =C2=A0};
> =C2=A0
> =C2=A0struct m2mtest_ctx {
> +	struct v4l2_fh		fh;
> =C2=A0	struct m2mtest_dev	*dev;
> =C2=A0
> +	struct v4l2_ctrl_handler hdl;
> +
> =C2=A0	/* Processed buffers in this transaction */
> =C2=A0	u8			num_processed;
> =C2=A0
> @@ -212,6 +176,11 @@ struct m2mtest_ctx {
> =C2=A0	struct m2mtest_q_data=C2=A0=C2=A0 q_data[2];
> =C2=A0};
> =C2=A0
> +static inline struct m2mtest_ctx *file2ctx(struct file *file)
> +{
> +	return container_of(file->private_data, struct m2mtest_ctx, fh);
> +}
> +
> =C2=A0static struct m2mtest_q_data *get_q_data(struct m2mtest_ctx *ctx,
> =C2=A0					 enum v4l2_buf_type type)
> =C2=A0{
> @@ -227,18 +196,6 @@ static struct m2mtest_q_data *get_q_data(struct
> m2mtest_ctx *ctx,
> =C2=A0}
> =C2=A0
> =C2=A0
> -static struct v4l2_queryctrl *get_ctrl(int id)
> -{
> -	int i;
> -
> -	for (i =3D 0; i < ARRAY_SIZE(m2mtest_ctrls); ++i) {
> -		if (id =3D=3D m2mtest_ctrls[i].id)
> -			return &m2mtest_ctrls[i];
> -	}
> -
> -	return NULL;
> -}
> -
> =C2=A0static int device_process(struct m2mtest_ctx *ctx,
> =C2=A0			=C2=A0 struct vb2_buffer *in_vb,
> =C2=A0			=C2=A0 struct vb2_buffer *out_vb)
> @@ -543,13 +500,13 @@ static int vidioc_g_fmt(struct m2mtest_ctx *ctx, st=
ruct
> v4l2_format *f)
> =C2=A0static int vidioc_g_fmt_vid_out(struct file *file, void *priv,
> =C2=A0				struct v4l2_format *f)
> =C2=A0{
> -	return vidioc_g_fmt(priv, f);
> +	return vidioc_g_fmt(file2ctx(file), f);
> =C2=A0}
> =C2=A0
> =C2=A0static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
> =C2=A0				struct v4l2_format *f)
> =C2=A0{
> -	return vidioc_g_fmt(priv, f);
> +	return vidioc_g_fmt(file2ctx(file), f);
> =C2=A0}
> =C2=A0
> =C2=A0static int vidioc_try_fmt(struct v4l2_format *f, struct m2mtest_fmt=
 *fmt)
> @@ -588,7 +545,7 @@ static int vidioc_try_fmt_vid_cap(struct file *file, =
void
> *priv,
> =C2=A0				=C2=A0 struct v4l2_format *f)
> =C2=A0{
> =C2=A0	struct m2mtest_fmt *fmt;
> -	struct m2mtest_ctx *ctx =3D priv;
> +	struct m2mtest_ctx *ctx =3D file2ctx(file);
> =C2=A0
> =C2=A0	fmt =3D find_format(f);
> =C2=A0	if (!fmt || !(fmt->types & MEM2MEM_CAPTURE)) {
> @@ -605,7 +562,7 @@ static int vidioc_try_fmt_vid_out(struct file *file, =
void
> *priv,
> =C2=A0				=C2=A0 struct v4l2_format *f)
> =C2=A0{
> =C2=A0	struct m2mtest_fmt *fmt;
> -	struct m2mtest_ctx *ctx =3D priv;
> +	struct m2mtest_ctx *ctx =3D file2ctx(file);
> =C2=A0
> =C2=A0	fmt =3D find_format(f);
> =C2=A0	if (!fmt || !(fmt->types & MEM2MEM_OUTPUT)) {
> @@ -658,7 +615,7 @@ static int vidioc_s_fmt_vid_cap(struct file *file, vo=
id
> *priv,
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> -	return vidioc_s_fmt(priv, f);
> +	return vidioc_s_fmt(file2ctx(file), f);
> =C2=A0}
> =C2=A0
> =C2=A0static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
> @@ -670,13 +627,13 @@ static int vidioc_s_fmt_vid_out(struct file *file, =
void
> *priv,
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> -	return vidioc_s_fmt(priv, f);
> +	return vidioc_s_fmt(file2ctx(file), f);
> =C2=A0}
> =C2=A0
> =C2=A0static int vidioc_reqbufs(struct file *file, void *priv,
> =C2=A0			=C2=A0 struct v4l2_requestbuffers *reqbufs)
> =C2=A0{
> -	struct m2mtest_ctx *ctx =3D priv;
> +	struct m2mtest_ctx *ctx =3D file2ctx(file);
> =C2=A0
> =C2=A0	return v4l2_m2m_reqbufs(file, ctx->m2m_ctx, reqbufs);
> =C2=A0}
> @@ -684,21 +641,21 @@ static int vidioc_reqbufs(struct file *file, void *=
priv,
> =C2=A0static int vidioc_querybuf(struct file *file, void *priv,
> =C2=A0			=C2=A0=C2=A0 struct v4l2_buffer *buf)
> =C2=A0{
> -	struct m2mtest_ctx *ctx =3D priv;
> +	struct m2mtest_ctx *ctx =3D file2ctx(file);
> =C2=A0
> =C2=A0	return v4l2_m2m_querybuf(file, ctx->m2m_ctx, buf);
> =C2=A0}
> =C2=A0
> =C2=A0static int vidioc_qbuf(struct file *file, void *priv, struct v4l2_b=
uffer
> *buf)
> =C2=A0{
> -	struct m2mtest_ctx *ctx =3D priv;
> +	struct m2mtest_ctx *ctx =3D file2ctx(file);
> =C2=A0
> =C2=A0	return v4l2_m2m_qbuf(file, ctx->m2m_ctx, buf);
> =C2=A0}
> =C2=A0
> =C2=A0static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_=
buffer
> *buf)
> =C2=A0{
> -	struct m2mtest_ctx *ctx =3D priv;
> +	struct m2mtest_ctx *ctx =3D file2ctx(file);
> =C2=A0
> =C2=A0	return v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
> =C2=A0}
> @@ -706,7 +663,7 @@ static int vidioc_dqbuf(struct file *file, void *priv=
,
> struct v4l2_buffer *buf)
> =C2=A0static int vidioc_streamon(struct file *file, void *priv,
> =C2=A0			=C2=A0=C2=A0 enum v4l2_buf_type type)
> =C2=A0{
> -	struct m2mtest_ctx *ctx =3D priv;
> +	struct m2mtest_ctx *ctx =3D file2ctx(file);
> =C2=A0
> =C2=A0	return v4l2_m2m_streamon(file, ctx->m2m_ctx, type);
> =C2=A0}
> @@ -714,101 +671,37 @@ static int vidioc_streamon(struct file *file, void
> *priv,
> =C2=A0static int vidioc_streamoff(struct file *file, void *priv,
> =C2=A0			=C2=A0=C2=A0=C2=A0 enum v4l2_buf_type type)
> =C2=A0{
> -	struct m2mtest_ctx *ctx =3D priv;
> +	struct m2mtest_ctx *ctx =3D file2ctx(file);
> =C2=A0
> =C2=A0	return v4l2_m2m_streamoff(file, ctx->m2m_ctx, type);
> =C2=A0}
> =C2=A0
> -static int vidioc_queryctrl(struct file *file, void *priv,
> -			=C2=A0=C2=A0=C2=A0 struct v4l2_queryctrl *qc)
> -{
> -	struct v4l2_queryctrl *c;
> -
> -	c =3D get_ctrl(qc->id);
> -	if (!c)
> -		return -EINVAL;
> -
> -	*qc =3D *c;
> -	return 0;
> -}
> -
> -static int vidioc_g_ctrl(struct file *file, void *priv,
> -			 struct v4l2_control *ctrl)
> -{
> -	struct m2mtest_ctx *ctx =3D priv;
> -
> -	switch (ctrl->id) {
> -	case V4L2_CID_HFLIP:
> -		ctrl->value =3D (ctx->mode & MEM2MEM_HFLIP) ? 1 : 0;
> -		break;
> -
> -	case V4L2_CID_VFLIP:
> -		ctrl->value =3D (ctx->mode & MEM2MEM_VFLIP) ? 1 : 0;
> -		break;
> -
> -	case V4L2_CID_TRANS_TIME_MSEC:
> -		ctrl->value =3D ctx->transtime;
> -		break;
> -
> -	case V4L2_CID_TRANS_NUM_BUFS:
> -		ctrl->value =3D ctx->translen;
> -		break;
> -
> -	default:
> -		v4l2_err(&ctx->dev->v4l2_dev, "Invalid control\n");
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
> -static int check_ctrl_val(struct m2mtest_ctx *ctx, struct v4l2_control *=
ctrl)
> +static int m2mtest_s_ctrl(struct v4l2_ctrl *ctrl)
> =C2=A0{
> -	struct v4l2_queryctrl *c;
> -
> -	c =3D get_ctrl(ctrl->id);
> -	if (!c)
> -		return -EINVAL;
> -
> -	if (ctrl->value < c->minimum || ctrl->value > c->maximum) {
> -		v4l2_err(&ctx->dev->v4l2_dev, "Value out of range\n");
> -		return -ERANGE;
> -	}
> -
> -	return 0;
> -}
> -
> -static int vidioc_s_ctrl(struct file *file, void *priv,
> -			 struct v4l2_control *ctrl)
> -{
> -	struct m2mtest_ctx *ctx =3D priv;
> -	int ret =3D 0;
> -
> -	ret =3D check_ctrl_val(ctx, ctrl);
> -	if (ret !=3D 0)
> -		return ret;
> +	struct m2mtest_ctx *ctx =3D
> +		container_of(ctrl->handler, struct m2mtest_ctx, hdl);
> =C2=A0
> =C2=A0	switch (ctrl->id) {
> =C2=A0	case V4L2_CID_HFLIP:
> -		if (ctrl->value)
> +		if (ctrl->val)
> =C2=A0			ctx->mode |=3D MEM2MEM_HFLIP;
> =C2=A0		else
> =C2=A0			ctx->mode &=3D ~MEM2MEM_HFLIP;
> =C2=A0		break;
> =C2=A0
> =C2=A0	case V4L2_CID_VFLIP:
> -		if (ctrl->value)
> +		if (ctrl->val)
> =C2=A0			ctx->mode |=3D MEM2MEM_VFLIP;
> =C2=A0		else
> =C2=A0			ctx->mode &=3D ~MEM2MEM_VFLIP;
> =C2=A0		break;
> =C2=A0
> =C2=A0	case V4L2_CID_TRANS_TIME_MSEC:
> -		ctx->transtime =3D ctrl->value;
> +		ctx->transtime =3D ctrl->val;
> =C2=A0		break;
> =C2=A0
> =C2=A0	case V4L2_CID_TRANS_NUM_BUFS:
> -		ctx->translen =3D ctrl->value;
> +		ctx->translen =3D ctrl->val;
> =C2=A0		break;
> =C2=A0
> =C2=A0	default:
> @@ -819,6 +712,10 @@ static int vidioc_s_ctrl(struct file *file, void *pr=
iv,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static const struct v4l2_ctrl_ops m2mtest_ctrl_ops =3D {
> +	.s_ctrl =3D m2mtest_s_ctrl,
> +};
> +
> =C2=A0
> =C2=A0static const struct v4l2_ioctl_ops m2mtest_ioctl_ops =3D {
> =C2=A0	.vidioc_querycap	=3D vidioc_querycap,
> @@ -841,10 +738,6 @@ static const struct v4l2_ioctl_ops m2mtest_ioctl_ops=
 =3D {
> =C2=A0
> =C2=A0	.vidioc_streamon	=3D vidioc_streamon,
> =C2=A0	.vidioc_streamoff	=3D vidioc_streamoff,
> -
> -	.vidioc_queryctrl	=3D vidioc_queryctrl,
> -	.vidioc_g_ctrl		=3D vidioc_g_ctrl,
> -	.vidioc_s_ctrl		=3D vidioc_s_ctrl,
> =C2=A0};
> =C2=A0
> =C2=A0
> @@ -956,6 +849,28 @@ static int queue_init(void *priv, struct vb2_queue
> *src_vq, struct vb2_queue *ds
> =C2=A0	return vb2_queue_init(dst_vq);
> =C2=A0}
> =C2=A0
> +static const struct v4l2_ctrl_config m2mtest_ctrl_trans_time_msec =3D {
> +	.ops =3D &m2mtest_ctrl_ops,
> +	.id =3D V4L2_CID_TRANS_TIME_MSEC,
> +	.name =3D "Transaction Time (msec)",
> +	.type =3D V4L2_CTRL_TYPE_INTEGER,
> +	.def =3D 1001,
> +	.min =3D 1,
> +	.max =3D 10001,
> +	.step =3D 100,
> +};
> +
> +static const struct v4l2_ctrl_config m2mtest_ctrl_trans_num_bufs =3D {
> +	.ops =3D &m2mtest_ctrl_ops,
> +	.id =3D V4L2_CID_TRANS_NUM_BUFS,
> +	.name =3D "Buffers Per Transaction",
> +	.type =3D V4L2_CTRL_TYPE_INTEGER,
> +	.def =3D 1,
> +	.min =3D 1,
> +	.max =3D MEM2MEM_DEF_NUM_BUFS,
> +	.step =3D 1,
> +};
> +
> =C2=A0/*
> =C2=A0 * File operations
> =C2=A0 */
> @@ -963,17 +878,29 @@ static int m2mtest_open(struct file *file)
> =C2=A0{
> =C2=A0	struct m2mtest_dev *dev =3D video_drvdata(file);
> =C2=A0	struct m2mtest_ctx *ctx =3D NULL;
> +	struct v4l2_ctrl_handler *hdl;
> =C2=A0
> =C2=A0	ctx =3D kzalloc(sizeof *ctx, GFP_KERNEL);
> =C2=A0	if (!ctx)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	file->private_data =3D ctx;
> +	v4l2_fh_init(&ctx->fh, video_devdata(file));
> +	file->private_data =3D &ctx->fh;
> =C2=A0	ctx->dev =3D dev;
> -	ctx->translen =3D MEM2MEM_DEF_TRANSLEN;
> -	ctx->transtime =3D MEM2MEM_DEF_TRANSTIME;
> -	ctx->num_processed =3D 0;
> -	ctx->mode =3D 0;
> +	hdl =3D &ctx->hdl;
> +	v4l2_ctrl_handler_init(hdl, 4);
> +	v4l2_ctrl_new_std(hdl, &m2mtest_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1,
> 0);
> +	v4l2_ctrl_new_std(hdl, &m2mtest_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1,
> 0);
> +	v4l2_ctrl_new_custom(hdl, &m2mtest_ctrl_trans_time_msec, NULL);
> +	v4l2_ctrl_new_custom(hdl, &m2mtest_ctrl_trans_num_bufs, NULL);
> +	if (hdl->error) {
> +		int err =3D hdl->error;
> +
> +		v4l2_ctrl_handler_free(hdl);
> +		return err;
> +	}
> +	ctx->fh.ctrl_handler =3D hdl;
> +	v4l2_ctrl_handler_setup(hdl);
> =C2=A0
> =C2=A0	ctx->q_data[V4L2_M2M_SRC].fmt =3D &formats[0];
> =C2=A0	ctx->q_data[V4L2_M2M_DST].fmt =3D &formats[0];
> @@ -983,10 +910,12 @@ static int m2mtest_open(struct file *file)
> =C2=A0	if (IS_ERR(ctx->m2m_ctx)) {
> =C2=A0		int ret =3D PTR_ERR(ctx->m2m_ctx);
> =C2=A0
> +		v4l2_ctrl_handler_free(hdl);
> =C2=A0		kfree(ctx);
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> +	v4l2_fh_add(&ctx->fh);
> =C2=A0	atomic_inc(&dev->num_inst);
> =C2=A0
> =C2=A0	dprintk(dev, "Created instance %p, m2m_ctx: %p\n", ctx, ctx-
> >m2m_ctx);
> @@ -997,10 +926,13 @@ static int m2mtest_open(struct file *file)
> =C2=A0static int m2mtest_release(struct file *file)
> =C2=A0{
> =C2=A0	struct m2mtest_dev *dev =3D video_drvdata(file);
> -	struct m2mtest_ctx *ctx =3D file->private_data;
> +	struct m2mtest_ctx *ctx =3D file2ctx(file);
> =C2=A0
> =C2=A0	dprintk(dev, "Releasing instance %p\n", ctx);
> =C2=A0
> +	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_exit(&ctx->fh);
> +	v4l2_ctrl_handler_free(&ctx->hdl);
> =C2=A0	v4l2_m2m_ctx_release(ctx->m2m_ctx);
> =C2=A0	kfree(ctx);
> =C2=A0
> @@ -1012,14 +944,14 @@ static int m2mtest_release(struct file *file)
> =C2=A0static unsigned int m2mtest_poll(struct file *file,
> =C2=A0				 struct poll_table_struct *wait)
> =C2=A0{
> -	struct m2mtest_ctx *ctx =3D file->private_data;
> +	struct m2mtest_ctx *ctx =3D file2ctx(file);
> =C2=A0
> =C2=A0	return v4l2_m2m_poll(file, ctx->m2m_ctx, wait);
> =C2=A0}
> =C2=A0
> =C2=A0static int m2mtest_mmap(struct file *file, struct vm_area_struct *v=
ma)
> =C2=A0{
> -	struct m2mtest_ctx *ctx =3D file->private_data;
> +	struct m2mtest_ctx *ctx =3D file2ctx(file);
> =C2=A0
> =C2=A0	return v4l2_m2m_mmap(file, ctx->m2m_ctx, vma);
> =C2=A0}

--=-eHMy1NkGu+2JqlsNyjmX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalgFWAAKCRDZQZRRKWBy
9KbuAQCGkQo56P58AqHMg04HNmnJq+c5rm6cIuZHO/TfS7ZkgQEA3Z9UK1rCQBi+
7dqFX3e+GppWBfeRGCTIRguJlBD8tA8=
=OJsw
-----END PGP SIGNATURE-----

--=-eHMy1NkGu+2JqlsNyjmX--
