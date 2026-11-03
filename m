Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744739;
	b=yosM6L8OyPEqxT6Z7D5T8pBgGtiw02Y8dLA5VC+QpSkmVDYkDoRBfROeN/XuI0ou/+zT
	 ZzOHftqU3bDdWzKuXG+J4MkZwFWGJwOG/EYTnx7DcbibnskH9HuBLn+xwCi81kBd3ViCe
	 wa0VcXuUgz9C0zTtX33rInFDuumzq0xEh1Zh7S8FQJrZDomTzBj1BXU8HWnAtIaLIu82S
	 cvj/eUzMkVwSBliKa3l+0nnWv0fqDTp6kpL2Bp6/BkuPdXZFdyTIncgFD25l1tKUYn3EF
	 aWlQ0bzPxKJK67qGxydGwyXUzu838gYkk6mCoSF+MUIS1LS0zIcfMVU5mRQrvPwOORg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=+X64KwJw/bpP3//ir0uig2ntRpVFdFSz8TkUlALC1z0=;
	b=pxIRtClmS5n9dWdupU0YkeKoBvEpOmmGRxVFbrePIS+dww9e28P4/gecEvbgWsea9ptr
	 5R86zx3o/FzxGGUwgSPA1meX/8ZclDSmIUcKSibIjEdedHeocoKiAMlUu1t3Dn66Dkkj3
	 oE2MThxCJwwsrkkS2DJ402kyscD0wJZF49jiZNFyR6vZfzy1RN1iCBJDD4h9VOTUimAsT
	 F2wCZ4fvOB7IEdcl6uNm94y3hBoUCmXecd8NZ2RNtAgpXJg2kH+O2kTgurn1oRo4MUr78
	 ROiTBGB9uMWIoPDROxM7cX9ImfvAmbxT5N/7Ogxu5YoFjW3BITPfL8ue1ds10BnSz7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ocmWFliD;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B268D606A328
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 22:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B268D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ocmWFliD
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93f3c89594cso10486585a.2
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 14:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793744738; x=1794349538; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+X64KwJw/bpP3//ir0uig2ntRpVFdFSz8TkUlALC1z0=;
        b=ocmWFliDthhaus2XMWWLT5QVxPiVdloQxHrQd/6EOrEzkz18T1yKB4UKTcDgBYbuDk
         iduxKYUqDEwa5uRTP8Nd0DedS0w4f+BfQ4k4CI+vkaxyRp8jRN6qdDM4FQNuM+HQiVw4
         xSRDY1a3tT4+rUZAEeESyBJhW/7gXzKs9mAU+vQWA1lKDL82QW7sADAjAlNQi01PHOCT
         /tFVz7MBI6UhL7BHKGo/O46ed0q1pS9yR8LzpZAcVK36TE5EcqOYkivclQ5o+SgCUNGT
         s7qqSz0fAVBpTH1icIAV0zRO9yNvuGhudCyaThSeNA/nZcQuAqOytUEo9ccXbUAVUB/P
         yaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744738; x=1794349538;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+X64KwJw/bpP3//ir0uig2ntRpVFdFSz8TkUlALC1z0=;
        b=EEvN89PGrZDbdJvRutxUeHCGO2o25Q7P8HnCdPfC9i88JB2D8VZHqFMXpKywzCHJPe
         Ru+HM82vkttw7KNY5aPv4lwDBMiJ2YIFyMh8Z8AckGpd/8CiLnEU4LQyiHxM9HcuzU2+
         wdwM5byO/jpQh1vlnBZVQQ1SNYq5WWyZe16b2Ng6AlOb5FXS52KgzJW+jL5j0BFr3GOe
         jhQtrweNAj2xOPO+unDtUcXxyLcl/CQvRszkJbf2SSA/HBrJ0yA+Dk1dAo5oCtwKJ3Fy
         TRuQ9ui4uIewX/V/uJORJh+JrAC7dpHMmoYfuCfDS5q6GNbUcD+gR5Efs6vNa+luqF0r
         Qtfg==
X-Gm-Message-State: APuU4Z+U3SQ57am8n8q0VcibErsbAEvoXD2DkDciRCxmkZDqjeTAN7sB
	K6gpEubHctqFLt32diVrQh5Hc0WjN9Peyo/PZSmhltwBRhKaLjv33wEosKCb5R7c2pM=
X-Gm-Gg: AYBFou2cPg7iJVWu+kAM6jyr3+CGTnAifXwOUaQxhfDfhAGGDZ9/WYhcZdYi9ghmcql
	RvAvKFK0jOAKEeKIdEWBnvDI6Pyry5Q7KG3bzV6l2ARCJliDJJO2bd3Uzra3EbLCK7xcgD+ybNB
	KGXOZDEK5VEWcMAbrD5qmdvOG9ECc42yySPMNyG6mIKI4RGP5mFy2dZ60hcNgRSJEL33Nt2jfDx
	iX9+8ZPK98R95kp4VP7f42FF39cQpd956E2xJq+JWejT/BIeUERYNkJOxbplA8+jYlH0/svIhfA
	vsRnrYH3FhEl4HeCQPZzMoZQOsYtyTJSm61xw/XcYhRfwf1nIlMJcpRmGOFoFA8ciG3mora8A/l
	F/2bEbX23ZodZx9ZyLFmz9voKstgRCWq+HWd6lskxVSy27Ud7FaUH9SkSd9VZeG0wZQK06Q+isI
	19eriIiK7FUKF3ujMY0dcCnM1ECcuTffdddJ8nlat5Y9W+HeKm2qJLxIfv/nreRtqzqmpujj/D5
	VyI+LY5zICM2TWFD+RF4SMAiwIHJtXCyvD6/gx9+mNqscstDIpnE6uaL777qfHICudXdSZOF+NV
	2xMdts0o3H7JMgycCgzCHHQT9lIM0Osdr32g3rj23VTUA3VlcXP076DJmZGeW4lZ9o64sXd3ius
	m
X-Received: by 2002:a05:620a:4001:b0:93f:4f87:4f5e with SMTP id af79cd13be357-9442175bcecmr2589895785a.72.1793744737675;
        Tue, 03 Nov 2026 14:25:37 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:bf53::5ac? ([2606:6d00:11:bf53::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d48648e3sm41659685a.35.2026.11.03.14.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:25:37 -0800 (PST)
Message-ID: <c73bb34ecd6f8b096023bfe6f5b19fd9787ec003.camel@ndufresne.ca>
Subject: Re: [PATCH 5/5] media: iris: Recycle decoder buffers for
 non-display pictures
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Xilin Wu <sophon@radxa.com>, Vikash Garodia	
 <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal	
 <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,  Bryan O'Donoghue	 <bod@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil	 <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, 	dragon@radxa.com, Chris Obbard
 <chris.obbard@oss.qualcomm.com>, Deepak Sikri	 <sikrid@qti.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,  Loic Minier
 <loic.minier@oss.qualcomm.com>, Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:25:35 -0500
In-Reply-To: <20261029-iris-va-fixes-v1-5-44a2783f782b@radxa.com>
References: <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
	 <20261029-iris-va-fixes-v1-5-44a2783f782b@radxa.com>
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
	protocol="application/pgp-signature"; boundary="=-kw5zuPNBaTwG5mlMULsg"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0


--=-kw5zuPNBaTwG5mlMULsg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 29 octobre 2026 =C3=A0 11:58 +0800, Xilin Wu a =C3=A9crit=C2=A0:
> HFI gen2 reports non-display pictures with HFI_GEN2_PICTURE_NOSHOW, but
> Iris returns them as errors. For AV1, hidden and displayed pictures can
> share a timestamp, so GStreamer's v4l2av1dec drops the pending frame and
> loses the displayed picture.
>=20
> Recycle successful non-display buffers within the driver instead of
> returning them to userspace as errors. This also fixes VP9 streams using
> hidden alt-ref frames.

This change is expected to improve conformance, even though you still can't
display multiple time the same reference in V4L2 stateful. Can you run flus=
ter
and share any conformance test that failed before and succeed today?

Nicolas

>=20
> Fixes: ac72ad9deafa ("media: iris: Add handling for no show frames")
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |  2 +
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 11 ++++-
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    | 47 ++++++++++++++++=
++++--
>  3 files changed, 55 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h b/drivers/m=
edia/platform/qcom/iris/iris_hfi_gen2.h
> index 21ab58e0aa84..79aac2d4e500 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
> @@ -20,6 +20,7 @@ struct iris_core;
>   * @packet: HFI packet
>   * @ipsc_properties_set: boolean to set ipsc properties to fw
>   * @opsc_properties_set: boolean to set opsc properties to fw
> + * @output_stopping: capture STOP command is awaiting its response
>   * @hfi_frame_info: structure of frame info
>   * @src_subcr_params: subscription params to fw on input port
>   * @dst_subcr_params: subscription params to fw on output port
> @@ -29,6 +30,7 @@ struct iris_inst_hfi_gen2 {
>  	struct iris_hfi_header		*packet;
>  	bool				ipsc_properties_set;
>  	bool				opsc_properties_set;
> +	bool				output_stopping;
>  	struct iris_hfi_frame_info	hfi_frame_info;
>  	struct hfi_subscription_params	src_subcr_params;
>  	struct hfi_subscription_params	dst_subcr_params;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/d=
rivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index a285e6fc8728..77ea153bf2d7 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -1172,7 +1172,16 @@ static int iris_hfi_gen2_session_stop(struct iris_=
inst *inst, u32 plane)
>  	if (ret)
>  		return ret;
> =20
> -	return iris_wait_for_session_response(inst, false);
> +	/* The response wait drops inst->lock, allowing buffers to be returned.=
 */
> +	if (plane =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +		inst_hfi_gen2->output_stopping =3D true;
> +
> +	ret =3D iris_wait_for_session_response(inst, false);
> +
> +	if (plane =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +		inst_hfi_gen2->output_stopping =3D false;
> +
> +	return ret;
>  }
> =20
>  static int iris_hfi_gen2_session_pause(struct iris_inst *inst, u32 plane=
)
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/=
drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index f0782c4b1e6e..a545410d1e8d 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -101,9 +101,7 @@ static int iris_hfi_gen2_get_driver_buffer_flags(stru=
ct iris_inst *inst, u32 hfi
>  		HFI_GEN2_PICTURE_CRA | HFI_GEN2_PICTURE_BLA;
>  	u32 driver_flags =3D 0;
> =20
> -	if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_GEN2_PICTURE_NOSHO=
W)
> -		driver_flags |=3D V4L2_BUF_FLAG_ERROR;
> -	else if (inst_hfi_gen2->hfi_frame_info.picture_type & keyframe)
> +	if (inst_hfi_gen2->hfi_frame_info.picture_type & keyframe)
>  		driver_flags |=3D V4L2_BUF_FLAG_KEYFRAME;
>  	else if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_GEN2_PICTURE_=
P)
>  		driver_flags |=3D V4L2_BUF_FLAG_PFRAME;
> @@ -345,9 +343,40 @@ static int iris_hfi_gen2_handle_input_buffer(struct =
iris_inst *inst,
>  	return 0;
>  }
> =20
> +static int iris_hfi_gen2_requeue_output_buffer(struct iris_inst *inst,
> +					       struct iris_buffer *buf)
> +{
> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 =3D to_iris_inst_hfi_gen2(inst=
);
> +	u64 timestamp =3D buf->timestamp;
> +	int ret;
> +
> +	buf->data_size =3D 0;
> +	buf->timestamp =3D 0;
> +	buf->flags =3D 0;
> +	buf->attr &=3D ~BUF_ATTR_DEQUEUED;
> +	buf->attr |=3D BUF_ATTR_DEFERRED;
> +
> +	/* Leave stopped buffers for streamoff cleanup or the next streamon. */
> +	if (inst_hfi_gen2->output_stopping ||
> +	    (inst->state !=3D IRIS_INST_STREAMING &&
> +	     inst->state !=3D IRIS_INST_OUTPUT_STREAMING))
> +		return 0;
> +
> +	ret =3D iris_queue_buffer(inst, buf);
> +	if (ret) {
> +		buf->attr &=3D ~BUF_ATTR_DEFERRED;
> +		buf->attr |=3D BUF_ATTR_DEQUEUED;
> +		buf->flags =3D V4L2_BUF_FLAG_ERROR;
> +		buf->timestamp =3D timestamp;
> +	}
> +
> +	return ret;
> +}
> +
>  static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
>  					      struct iris_hfi_buffer *hfi_buffer)
>  {
> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 =3D to_iris_inst_hfi_gen2(inst=
);
>  	struct v4l2_m2m_ctx *m2m_ctx =3D inst->m2m_ctx;
>  	struct v4l2_m2m_buffer *m2m_buffer, *n;
>  	struct iris_buffer *buf;
> @@ -390,8 +419,18 @@ static int iris_hfi_gen2_handle_output_buffer(struct=
 iris_inst *inst,
> =20
>  	buf->flags =3D iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->=
flags);
> =20
> +	if (inst->domain =3D=3D DECODER &&
> +	    inst_hfi_gen2->hfi_frame_info.picture_type & HFI_GEN2_PICTURE_NOSHO=
W) {
> +		/* A hidden reference picture is neither a display frame nor an error.=
 */
> +		buf->data_size =3D 0;
> +		if (inst->state =3D=3D IRIS_INST_ERROR)
> +			buf->flags |=3D V4L2_BUF_FLAG_ERROR;
> +		if (!(buf->flags & (V4L2_BUF_FLAG_ERROR | V4L2_BUF_FLAG_LAST)))
> +			return iris_hfi_gen2_requeue_output_buffer(inst, buf);
> +	}
> +
>  	if (!buf->data_size && inst->state =3D=3D IRIS_INST_STREAMING &&
> -	    !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST)) {
> +	    !(buf->flags & V4L2_BUF_FLAG_LAST)) {
>  		buf->flags |=3D V4L2_BUF_FLAG_ERROR;
>  	}
> =20

--=-kw5zuPNBaTwG5mlMULsg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaupfXwAKCRDZQZRRKWBy
9G1WAP4upESswG3B+8qzt7hJnFaIfvEhMFsyEB4fyJ77ElscJgD8Cck4jlfH0r75
AKOv2ZnjwczyDLOAUcF4xYhtDOYeBAk=
=BbQV
-----END PGP SIGNATURE-----

--=-kw5zuPNBaTwG5mlMULsg--
