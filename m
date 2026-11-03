Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744445;
	b=mP1X8HDwkRhTtNsNG3k7tVGdcpKhydKZQToPETBoU4HuQ4Rexx36XMpzH2pfpwTMT6de
	 kv+9TmeVQKfO/yxylvZv60nfegqDFkSYWskXXwRuCUXgFE5TUIkKinun9hbY0llerDGa/
	 8IploWtN2GT2gj79Hh2hnJFsziLv0Ivf80js9DVsZfy/Yc0jXJtXhAfzCN+qPusyFCN9u
	 xHWHyOUWSbHs+wpiIU74pOFjE9aMXBdWT8YTT7USiD+xoqW5BMN6k2YiK8deyGzERYbWS
	 /TseSoV+rJiQln0Tn0vc0pK+vj5b8eEWpJMHaKFAKNrqQPz6a5lDDegk8jdt6Sp+fTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=OqOh2QjnH5nqEhUIXpQWCnON/bvvbA6ymt53jFtBxJ4=;
	b=vpAwe7Dnng7JqolM78dcA9kH3PSV3wnwB5POReMoMqzn5CEE3nb5QQ4AE5PlT4wS2jWW
	 kTGIKMS2WzC1PP+ZKdGmf9fLtCmtX6lERIUFSWe2/RdBrtKoY6/mJ8SK7uJXFhjEc7WCP
	 2h+iiEZMYdXa6ix3AfnXI4hDINYhqL1KcrKHNo7Y1CgHBBKX0e+7XtjeVWLorOrc32pwU
	 /vaBIr2fUQbB8nan9ChCIwN1LPJLVCcIZ92IYVuTsdFhgqk3Rmbi94dUeN1NRoNdtOih7
	 z6RH5sfCA5meNRYGc70kPCBdrnEVbJE4Q6Bp6anJ4WVXO44aQ4vXsbpHpCguHYxn87g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F2SXbRM7;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD944606A324
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 22:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD944606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F2SXbRM7
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-943e8d35f74so11725385a.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 14:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793744444; x=1794349244; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OqOh2QjnH5nqEhUIXpQWCnON/bvvbA6ymt53jFtBxJ4=;
        b=F2SXbRM7Mn8fUJuu2AkM5jd8JLrEDXWGhjEit4QqcWFCQkn/3FMFa85CVF7eUeUbgu
         1M5mEXzE3dMfNVckZhosJjpsOJgMkneVzRLye65k6Pu3HQrUQ+b2j/mwozL4J04BFnMO
         g12rc224skqk4QJsNsVfxYqr4zHfkSGrXkvwbHl/lOfL+4MzokBrpEJ+32LMkbmLKRY5
         CnZwy3LMQ4Kg3wnPnp6zLDHkdn0dnbs3eVarh8n0BGXg65Oof36nNHTakJBLMiYJqHN/
         UFO8Be8fsvdaGhUDJd8KCO9+vk//EtXtnLaQBhn9L0omAjqxO/IiGuWizLkUN1S0OeCF
         jsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744444; x=1794349244;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OqOh2QjnH5nqEhUIXpQWCnON/bvvbA6ymt53jFtBxJ4=;
        b=z/GW01qsar9xKqQeZ89di6rQsKrCGtQURQ4a7qjVnZf71Qvo39yRB+2dmncbFNOlH2
         ii/2b99dn/ZuqBIDQsYoCd4tWHzSNCuvCo8xkUyHVLurPtgUo+dCPvvLBXVPvf2Z2Ojf
         8fjAMxPD3120AebyySTQx4pZN7J4V95OwUw9SkY4avAc+RbrqiGkwZT+HuHLzva1F1AV
         kRtCt4/l2dVZdbn0VfY9Ryim52rsQbJn0BZEfrO/GJrQUARJfwrN+3ZzwG9BIb1Zi5ab
         V8TmZ1mUDXSkYtdSIqJuhNBDkxpj6cx4NFuvBXFNTeMpipEqhdSByO5hWEvRZBMgs1o8
         KuWA==
X-Gm-Message-State: APuU4Z8Y6gaoxIKYxM9oBI8ErlE9WC2Rh6CCpn0YXq6ktZX4PayV4bNE
	zrVN0tRkezgwROLJ5e0Y1Hk9Sjpz+yf8htJEGQke7zvN85grDr9iuLkLimuzOU+xXbA=
X-Gm-Gg: AYBFou11h4J7uU/WMZlgge2RwXDbRBtZFRNW538rMo1Tnw2M/cgAQP95ewDf9XsMiIF
	83zLRi4DLEkk4987zavx8f3I0eYCI4gmOZMT0G2jDVDBIEoOdnzKMUtcQr4e1BgRVhoJ7l1iUDT
	+2LNObNZlgzMpxBoqpdP2tCv7NZ3DcqOuyMSCXdyQiScMBZbvWzTrbfXlzVb+ceDD2+YMhgVjIv
	+Xy31XFKkDEB+MAiBR9CP7hHcGHIvpj3MVoQfrxDvqbA8IWqV3+0Y7ugKv+C3KJ6l9negemNcQ8
	O3M6rIUBEi0F9nsuhP/JNYM6D7dueuL8CdmpWJVuNDaCaq5jKHb2iRKRqaHC+6sEMLiwBLN4osD
	2P6c8+q0wzA2izgsvFkkLtMH4/LdiU3xFpAmPZTiApze1UH8jlmR8SaqURWADqAlvr7yFHmK/PR
	bGTi9sJSeqxLjIkVQWEj45O64d94WwnmYPwN7qCnT+pnStn781eBgZuhnYN36iCspI28rHrb79T
	5U+4YeEnkQS60bMnJpVb3DDjpZEYICeX0ucqyA2bOJV2QmNU6VCoAuvIh2r6ix/Y31RGTR0A3+m
	Q6tWoMuoPqCv1C1IeR6ukrNQeavqljdwxOTALWPofdsvJj3rOXpGlvU=
X-Received: by 2002:a05:620a:2987:b0:93e:a8c5:132f with SMTP id af79cd13be357-94421744f15mr2434867585a.29.1793744443800;
        Tue, 03 Nov 2026 14:20:43 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:bf53::5ac? ([2606:6d00:11:bf53::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d488d41csm39923185a.38.2026.11.03.14.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:20:43 -0800 (PST)
Message-ID: <456a7ad925afe7caf52d39ff300089c8ec79e4e8.camel@ndufresne.ca>
Subject: Re: [PATCH 2/5] media: iris: allow larger capture buffer pools on
 HFI gen2
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
Date: Tue, 03 Nov 2026 17:20:41 -0500
In-Reply-To: <20261029-iris-va-fixes-v1-2-44a2783f782b@radxa.com>
References: <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
	 <20261029-iris-va-fixes-v1-2-44a2783f782b@radxa.com>
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
	protocol="application/pgp-signature"; boundary="=-0KaBDc6xtZ7L+h2NjFYv"
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


--=-0KaBDc6xtZ7L+h2NjFYv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 29 octobre 2026 =C3=A0 11:58 +0800, Xilin Wu a =C3=A9crit=C2=A0:
> VLC with VA-API frame threading can require more than the default vb2
> limit of 32 CAPTURE buffers.
>=20
> Raise the HFI gen2 decoder CAPTURE queue limit to 64 buffers.
>=20
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vidc.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media=
/platform/qcom/iris/iris_vidc.c
> index 05aab6e3005d..8c96b007b391 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -140,6 +140,9 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src=
_vq, struct vb2_queue *dst_
>  	dst_vq->drv_priv =3D inst;
>  	dst_vq->buf_struct_size =3D sizeof(struct iris_buffer);
>  	dst_vq->min_reqbufs_allocation =3D MIN_BUFFERS;
> +	if (inst->domain =3D=3D DECODER &&
> +	    inst->core->iris_firmware_data =3D=3D &iris_hfi_gen2_data)
> +		dst_vq->max_num_buffers =3D DEFAULT_MAX_HOST_BUF_COUNT;

Why is this limited to decoders? Also, why not move the max into the firmwa=
re
data, so this code path can stay idiomatic.

Nicolas

>  	dst_vq->dev =3D inst->core->dev;
>  	dst_vq->lock =3D &inst->ctx_q_lock;
> =20

--=-0KaBDc6xtZ7L+h2NjFYv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaupeOgAKCRDZQZRRKWBy
9NGUAP0fC+HgIUz6Yzta6e9e0/oLBqp87VokMecAXd3ZQ7RlbAD+MZPNNWQ9iSpb
4T9b1oJD4rvhHyJ7DFX/pGRV+UAomAE=
=kY4J
-----END PGP SIGNATURE-----

--=-0KaBDc6xtZ7L+h2NjFYv--
