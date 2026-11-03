Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744285;
	b=QQuBDtTLoCLy7Ynu7HmNt8xUSGIvSZJNfxgxfe1QubtEqrB0FIdtAJF+pl6iumtO0J7m
	 XtYn9JgTPbgubjBM91j7UaoQNj+TZr3hG9vwr8iENJY0C89MyIK/mL6H3rYXeCV9aDTao
	 n5Q9B+UvORfEI/NaJOBm2tKSU/DKUk3KPGKMJ93G2NTxzILIsLISaFWJIYtQBOUY0SJAR
	 fWvQMLjg5Q43XREjgvx7FULmCeAaj6WLmmxR2FaSOvs+JAv4/STo6TPltoEKyzdXo8k9i
	 XJkO9+0UkA0xO378jtER+f+IPb1Cyg0ExuVFltbWS35ZX22+mn9IVOWhRcmGmlajOcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=6sjUhecbVCuF24hELr33/smJ/3QrGMYfogXmAJdfKZY=;
	b=XsZ9z53r1y/bj0s2RkzwpOzxInZl1vhU+JO5/EvLDUdJPsjAi646GHQ7oizPpJ3nEZ0e
	 qakqv3Bny0hn9Bhu6cjGqiS0fUffQtWw7x5L77MXEIHtrVdcnaR5GVxViK5E8Yhm0kskx
	 wpNxp4KKCh9TF35nC3qyCYcH1P5A5qJwiTwCELUZ8zs6w2hhndtsLtXM7ksggo/OLNrMi
	 L6bzz5gj42My9XKbzimsTWg2ioZarhaXXnbZAdQp2rRI9QPWmXKY1vPACRWQgai++whgu
	 f0aHOgYBu0x410WZiFEL1wPXQKkY3FPvTw5tCN93NOaVDPjQDOeB7ik2YXpcL+keXpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="lnY9rI/C";
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8BA606A31B
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 22:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD8BA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lnY9rI/C
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-945ae2daa66so13312085a.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 14:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793744284; x=1794349084; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6sjUhecbVCuF24hELr33/smJ/3QrGMYfogXmAJdfKZY=;
        b=lnY9rI/CEgiUy3WgqOZQ1OtvmBa1k8aiXZmhAYaB3gyA8XWT87XpcclXzIb3fFxCID
         jAVbDA/OMb6boRgNS64yC+vUnbLQFtywuJMsgiE7gm2vchTJnZL9haQU3Sh/DLszNF+i
         pGK7kKJK3I8q+70UCFdEW2nyNPlXv9T3z5DQOWslbqt19mdAefzRTpCmJpK3ShEP7xn6
         YVXmJswFFxiyzy1IMfEQCtPbvTHChGaUaAfi063b2kZ9CRNrO71OOs+RVKAQTNAS5mt4
         jYkNLJmZJkSg53g8NNlOzXHAvP7P/k3Ayfd6HqEpLw5vMQ6EtdGivrOYfxJkcruNgs10
         EWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744284; x=1794349084;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6sjUhecbVCuF24hELr33/smJ/3QrGMYfogXmAJdfKZY=;
        b=CdT3Y3J+c3UwPxkh59DyjrSzG91aLWj9kM2/DdAuJHVkQOBsj3ZbjqfB2Ij2bP+Vcy
         NZlwQUCj213vVpgEA0Hy+o+sA+xBJJ1OUzcwzDTazYArBu6YPhJqCBn4eO9FDSLH/+RE
         wTNZp3aAuQRi7YBRNpKENZyjC0sjaO3bVvYjbILIf8TaOxcFmnlu1uWxPbvU8I+HfTB1
         eeJ2gEc5FoXbBjtn7Lz8BqAaLcVIufeB1sNYg8+zoYdMU6fEc/RDEv5xO/tj19nq1ydp
         a9guHFoBFBA4JuzdpwubBnD6djJJwYN9GhcxdjJIkwV5XuSQyb0RjHcEp66Cf409obpW
         jI7g==
X-Gm-Message-State: APuU4Z+m7jGTPvjRGqb/YdWaHI56tEwn/iFc8qOTdF3FxbQfdAc8xtVn
	FoBasrQjp1AiabvtJo0l/0B6rysAPlZz2F/k2bkJaUly+jGnxZFBGIW52JtspEL9QbU=
X-Gm-Gg: AYBFou0bONcyJqnKqfsV5+FHvO/DwZSFyTT5bgw3ae60MiyL66tOgYMkgaftuuMRih+
	45CGaSAplfggWDmg+Vy6k0j9xmvUoxJPrIevufXAYEz1PAQvsl53nO2XDkwNhEUChjyJwSXlCvy
	r1ybVO7HXe2ErQwEfwcbSA+jMcj4LwafiqzXQdh7N8W6vIPko7n+SCU5WgvIKxbDumeTRnnuHZ7
	DpZVAQcETA+E0v7Ib1lQ1K1fYxe4m0qFFa73n4x1VBx3DGAqjY0YN5OTzKelEdyMng9R9BbmOG/
	5/j2SVzJGeJIQ0y4B5vrhQvyOY+uHIAwgIw1r0roPM1y8v+okNdYq5RIxmbk7RWDIWzGXxwaab9
	YYOxE9Puq7ODFZWa3w3hvYnPl/Lt1cixmigPz6g6gSsZUMmd/f+WcN3Q1Xvp1S75eC/d5R6Ym4N
	k58RJnfIqWtN4gBSA2Xkr3eVnsSR9zpBEEejFMItBWXX2fgmIyq/Ok8wCg+k2p7aun2iDnnhMTm
	dTVpfv43mdKPRWozxJs0GwtoMYBEa6JwAxKRmBuHvNh6XzVRRTRh7gOY2X0syPtg5Ox/ZlSZO1U
	jt3s2aegmE9/50zCWOmYGH+fBn2pf/0B+1uMB5dGSscOgPt9VkFuORI=
X-Received: by 2002:a05:620a:2994:b0:93e:c12c:9b6d with SMTP id af79cd13be357-944217f99e9mr2285683085a.72.1793744283564;
        Tue, 03 Nov 2026 14:18:03 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:bf53::5ac? ([2606:6d00:11:bf53::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d48577ebsm39906885a.33.2026.11.03.14.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:18:02 -0800 (PST)
Message-ID: <c582354dbf7250278f55be59f5d34cfb8c6629b9.camel@ndufresne.ca>
Subject: Re: [PATCH 1/5] media: iris: support decode-order output on HFI gen2
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
Date: Tue, 03 Nov 2026 17:18:01 -0500
In-Reply-To: <20261029-iris-va-fixes-v1-1-44a2783f782b@radxa.com>
References: <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
	 <20261029-iris-va-fixes-v1-1-44a2783f782b@radxa.com>
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
	protocol="application/pgp-signature"; boundary="=-d2qUSvPlVHSugIJEshhR"
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


--=-d2qUSvPlVHSugIJEshhR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 29 octobre 2026 =C3=A0 11:58 +0800, Xilin Wu a =C3=A9crit=C2=A0:
> Synchronous per-picture clients such as VA-API can stall when firmware
> holds decoded pictures for display reordering while the client waits for
> the current picture before submitting more input.
>=20
> Expose the decoder display-delay controls on HFI gen2, with a zero delay
> selecting decode-order output. Keep display-order output as the default.

Ack-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

A better justification would be to match Venus feature here. Doing VA-API i=
s a
bit borderline as nobody will understand that VA does not work in the norma=
l
V4L2 stateful decoder order, nor the level of spurious effort needed to glu=
e
these two things together.

Nicolas

>=20
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c        |  8 ++++++++
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c     | 20 ++++++++++++++=
++++++
>  .../media/platform/qcom/iris/iris_hfi_gen2_command.c | 18 ++++++++++++++=
++++
>  .../media/platform/qcom/iris/iris_hfi_gen2_defines.h |  1 +
>  .../media/platform/qcom/iris/iris_platform_common.h  |  2 ++
>  5 files changed, 49 insertions(+)
>=20
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/medi=
a/platform/qcom/iris/iris_ctrls.c
> index 4f2633bbb49f..1dbea37c93c3 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -155,6 +155,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_i=
d(u32 id)
>  		return LAYER4_BITRATE_HEVC;
>  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
>  		return LAYER5_BITRATE_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:
> +		return DISPLAY_DELAY_ENABLE;
> +	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:
> +		return DISPLAY_DELAY;
>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
>  		return REQUEST_SYNC_FRAME;
>  	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
> @@ -306,6 +310,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_ca=
p_type cap_id)
>  		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
>  	case LAYER5_BITRATE_HEVC:
>  		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
> +	case DISPLAY_DELAY_ENABLE:
> +		return V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE;
> +	case DISPLAY_DELAY:
> +		return V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY;
>  	case REQUEST_SYNC_FRAME:
>  		return V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME;
>  	case SLICE_MODE:
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/m=
edia/platform/qcom/iris/iris_hfi_gen2.c
> index 79bbd06ef8d2..65af61b63a29 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> @@ -842,6 +842,22 @@ static const struct platform_inst_fw_cap inst_fw_cap=
_milos_enc[] =3D {
>  };
> =20
>  static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] =3D {
> +	{
> +		.cap_id =3D DISPLAY_DELAY_ENABLE,
> +		.min =3D 0,
> +		.max =3D 1,
> +		.step_or_mask =3D 1,
> +		.value =3D 0,
> +		.hfi_id =3D HFI_PROP_DECODE_ORDER_OUTPUT,
> +		.flags =3D CAP_FLAG_INPUT_PORT,
> +	},
> +	{
> +		.cap_id =3D DISPLAY_DELAY,
> +		.min =3D 0,
> +		.max =3D 0,
> +		.step_or_mask =3D 1,
> +		.value =3D 0,
> +	},
>  	{
>  		.cap_id =3D PROFILE_H264,
>  		.min =3D V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> @@ -1818,6 +1834,7 @@ static const struct platform_inst_fw_cap inst_fw_ca=
p_sm8550_enc[] =3D {
>  };
> =20
>  static const u32 sm8550_vdec_input_config_params_default[] =3D {
> +	HFI_PROP_DECODE_ORDER_OUTPUT,
>  	HFI_PROP_BITSTREAM_RESOLUTION,
>  	HFI_PROP_CROP_OFFSETS,
>  	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> @@ -1830,6 +1847,7 @@ static const u32 sm8550_vdec_input_config_params_de=
fault[] =3D {
>  };
> =20
>  static const u32 sm8550_vdec_input_config_param_hevc[] =3D {
> +	HFI_PROP_DECODE_ORDER_OUTPUT,
>  	HFI_PROP_BITSTREAM_RESOLUTION,
>  	HFI_PROP_CROP_OFFSETS,
>  	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> @@ -1841,6 +1859,7 @@ static const u32 sm8550_vdec_input_config_param_hev=
c[] =3D {
>  };
> =20
>  static const u32 sm8550_vdec_input_config_param_vp9[] =3D {
> +	HFI_PROP_DECODE_ORDER_OUTPUT,
>  	HFI_PROP_BITSTREAM_RESOLUTION,
>  	HFI_PROP_CROP_OFFSETS,
>  	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> @@ -1850,6 +1869,7 @@ static const u32 sm8550_vdec_input_config_param_vp9=
[] =3D {
>  };
> =20
>  static const u32 sm8550_vdec_input_config_param_av1[] =3D {
> +	HFI_PROP_DECODE_ORDER_OUTPUT,
>  	HFI_PROP_BITSTREAM_RESOLUTION,
>  	HFI_PROP_CROP_OFFSETS,
>  	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/d=
rivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 388a36ff2b07..a285e6fc8728 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -665,6 +665,23 @@ static int iris_hfi_gen2_set_super_block(struct iris=
_inst *inst, u32 plane)
>  						  sizeof(u32));
>  }
> =20
> +static int iris_hfi_gen2_set_decode_order_output(struct iris_inst *inst,=
 u32 plane)
> +{
> +	struct platform_inst_fw_cap *cap =3D &inst->fw_caps[DISPLAY_DELAY_ENABL=
E];
> +	u32 decode_order =3D cap->value;
> +
> +	/* Leave the firmware default unchanged unless userspace sets the contr=
ol. */
> +	if (!(cap->flags & CAP_FLAG_CLIENT_SET))
> +		return 0;
> +
> +	return iris_hfi_gen2_session_set_property(inst,
> +						  HFI_PROP_DECODE_ORDER_OUTPUT,
> +						  HFI_HOST_FLAGS_NONE,
> +						  HFI_PORT_BITSTREAM,
> +						  HFI_PAYLOAD_U32,
> +						  &decode_order, sizeof(decode_order));
> +}
> +
>  static int iris_hfi_gen2_session_set_config_params(struct iris_inst *ins=
t, u32 plane)
>  {
>  	const struct iris_firmware_data *fdata =3D inst->core->iris_firmware_da=
ta;
> @@ -691,6 +708,7 @@ static int iris_hfi_gen2_session_set_config_params(st=
ruct iris_inst *inst, u32 p
>  		{HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate    =
         },
>  		{HFI_PROP_AV1_FILM_GRAIN_PRESENT,     iris_hfi_gen2_set_film_grain    =
         },
>  		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block   =
         },
> +		{HFI_PROP_DECODE_ORDER_OUTPUT,        iris_hfi_gen2_set_decode_order_o=
utput    },
>  	};
> =20
>  	if (inst->domain =3D=3D DECODER) {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/d=
rivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 2b8b057d35a9..e89ed4075526 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -130,6 +130,7 @@ enum hfi_flip {
> =20
>  #define HFI_PROP_FLIP				0x0300014c
>  #define HFI_PROP_SIGNAL_COLOR_INFO		0x03000155
> +#define HFI_PROP_DECODE_ORDER_OUTPUT		0x0300015b
>  #define HFI_PROP_PICTURE_TYPE			0x03000162
>  #define HFI_PROP_DEC_DEFAULT_HEADER		0x03000168
>  #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/dr=
ivers/media/platform/qcom/iris/iris_platform_common.h
> index cddab9a9c375..aa8cd2e1b3f1 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -211,6 +211,8 @@ enum platform_inst_fw_cap_type {
>  	SLICE_MODE,
>  	SLICE_MAX_BYTES,
>  	SLICE_MAX_MB,
> +	DISPLAY_DELAY_ENABLE,
> +	DISPLAY_DELAY,
>  	INST_FW_CAP_MAX,
>  };
> =20

--=-d2qUSvPlVHSugIJEshhR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaupdmQAKCRDZQZRRKWBy
9IgAAP9RbYggAl05gWhoKd3ma298imYChRhTCJEtV4CEaxIR2AD/fyDhb3qjtCg9
O1A3gJJ1PByQqHuVJP8B7E38m3pDHg8=
=cfwi
-----END PGP SIGNATURE-----

--=-d2qUSvPlVHSugIJEshhR--
