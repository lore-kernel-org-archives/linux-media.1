Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720669;
	b=O8a2O+9ur35bD2WBbndE5EuFpMjNY3wFQN280pyruV5NtOSuDS5JVDX2qFVGbaY3S/e5
	 PvJDmPGq3e9ua+BU3klYGm1hBDb7Aale+aNCW9RhL3N4ck2k9oCo+oDRuZGoKJlmZBJQW
	 uDfEiHvhf36vBl4ltcjPg7iJ1Xkaz+DgKJGj8Nj5OrqmkljF19vggomYgzs+9NRPiofMN
	 XQFwXmrEd6T0Go+Lp2tzXNbIJa3pPyrLRFTwocxjDpgDzWUZsNou3WgOO+z6eXDy3/yPC
	 P7iSmbFeSXjYbd97Mk/uN9XbNUQhMVJSpyL8TqWCBIKz/NTcRf9Af299FRkJLsalvlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=nLhbzQhcrJcE5zHgH9QEWsAoAStLTeamvslZak3IipI=;
	b=o9Z4L8lbeSiH+ck73O8fo5BhHEA7bHp0PT5o3k/D5crjISmCZBY3t/wJA4WPHKTKx7WY
	 RL444lDkU0w9QGmt0dZ/B1eYWHVeP731LsI1OjzwFsJ52hPpq13xSxfzYKq8pHrVDXUot
	 u1JG3TWpuSY/RcF+92T0Iy47Kvv4Y8uI6Kdz8tN5Og8d3wYegqqS9HbxXfGyyKyFd8KNL
	 Qn4R1+r2IWqgxC0vmUbvIxdHZDUx9dPCu794jzj9eVovNszTaC74drFxpuXH2ERH7NAqj
	 DgpRwRaMnHGAitlAclLBPQTM35RgfR2j+A8GrwYZ0uY+LS3n/0NslWt7hWbAePrxgOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=U2sluQDB;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C016606A32D
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 15:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C016606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=U2sluQDB
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-713e6ecf595so826028eaf.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 07:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793720667; x=1794325467; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nLhbzQhcrJcE5zHgH9QEWsAoAStLTeamvslZak3IipI=;
        b=U2sluQDB45SVmfoOc5qsQjR9RgmMInyalxugOfxiQwTg4CNO50voTBmbiMbyBrob5i
         UGZo5Tg9e7cgytcq6XmIoO6Ppot0iazwvAeGcdLdoSXCUuzGhlXUuowIrLoyuIYt9hKh
         PA/Ly/oDiLRgehx+21oqo+ss8GOrM5rQgA0dMdp4IDEvKI+bPpKUjwKGBbpY5dMsXTYT
         Gi9U19MQUj3T54TLGA0U6eqD3z6kVEb5v+ZggNzQJLaOlAEltw+NFUrzOkQL00++H2VK
         vwcsRd8AO6GxQA+NQT4iNCNT8e1RjjLz5tfnf0p2afVr7EwJfnDwPeh5gsrQZe//PjS6
         w/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720667; x=1794325467;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nLhbzQhcrJcE5zHgH9QEWsAoAStLTeamvslZak3IipI=;
        b=KZJnaimKaz5kVQ2S1gJDy14ACQv8SDINs6XgkPx4A5QEK1WMA3QYyExzoOdcF4gJgd
         zySHLQNiJNXg1sfR11s+938YBUYYi7Scex0aUes6XRtJ8auZwSjdWwIPx8fa0cbXsNgr
         CEiCfm1RvJ///IXphrK+740l/vYbEg3B45hO6emOCKCthS7GfZNMBLdWvowmNhyoL7h5
         yjM6+yuiZsr14OtLLCvSUh4hgDJW7OqEGZbDlomFQkkIS3z5+WlVMsx3WT2nRqgnu56Y
         dXMBeqMlHTRxBI3if+1oViPoBuRezvi/Wqitqa24wfRGvOkCOF0DuCPJB5BEN2dA7poa
         gr1A==
X-Gm-Message-State: APuU4Z82lRh4zW1+WeYRZhGTID3rYwAQ1KNwZBCraNj5QzAJ0Fy25RAw
	MS7o22dxylmPdZ5dJyk/e+Clla+A72AUkmqdn6denXb10biB5L8sNey4DrH9ARlevLc=
X-Gm-Gg: AYBFou32Vy8V+KtJSRzgeOfR7g4mngdlN/le9bg+m99j0JNxRPlGkMZ2Q7Irqkqob2B
	z9qgPN/2KGxG4tKCvht5ZaASTqRtueP3TSZ1IHSifH2X5F2ujngrTVOf2jtdY7edHDy8EzVNUmG
	TsOlTpQt55SfKRvk/uT6iHIgMSsZyjlKRbR/WkD8wxqblY/MSHGk38q2nqOrkOr4a/V3h9oYLtH
	urL3ES00/qlD/sCs0PACB836LiOx+AsNesbJqchsldd/Z9dx2EFF9IMHJeS05KWm0geN01ULCaa
	Uez46s5er/TaBiFMKhY3DKUZ4fA00eN6+dBmtgLIFQKV5JjbzrqaUneX/oDCxzPyOM5d//VXf0N
	ZdTJcoGJINb6T52A3JHKemdkzfvqLnHLN+QESRe9Tgv7ICQSfNE7HT12wWkZK/WJpkNaOatUE+R
	8CZNDtrCUdcFwMx9oEKp/iD1Ik78ZJ7U4kOqTc486FztmhLgg4W0LvIbisyYxCaHYN0HzPKUjrk
	GBqRD+zgCFtg1uLOY0IexJPIgciD06Vzr84UCi5GIEVsh7pt4/0pMcyu3oneF1uSZIW/8mnHPNa
	CXaUp0/+ybzb6NDpog0Zb1R0yHa5LRnkF4DS4+ffZZu47YjogW5S8Hw=
X-Received: by 2002:a05:6820:1396:b0:715:21d1:b87 with SMTP id 006d021491bc7-71521d11e77mr2519618eaf.0.1793720667310;
        Tue, 03 Nov 2026 07:44:27 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:bf53::5ac? ([2606:6d00:11:bf53::5ac])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2a84854sm11673087eaf.2.2026.11.03.07.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:44:26 -0800 (PST)
Message-ID: <116d7e6546741c73235006a0d3515d313a12c275.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mtk-vcodec: vdec_vp8_if: guard list_first_entry
 on empty fb node pool
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Li Ximo <lixicaicai@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	 <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Wang Haoran
	 <haoranwangsec@gmail.com>
Date: Tue, 03 Nov 2026 10:44:24 -0500
In-Reply-To: <20261023075633.3662574-1-lixicaicai@gmail.com>
References: <20261023075633.3662574-1-lixicaicai@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-uJ4gl++ULVroAHyp7KGb"
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


--=-uJ4gl++ULVroAHyp7KGb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 23 octobre 2026 =C3=A0 15:56 +0800, Li Ximo a =C3=A9crit=C2=A0:
> From: Wang Haoran <haoranwangsec@gmail.com>

Concistency comment, use "media: mediatek: vcodec:" subject prefix.

>=20
> list_first_entry() does not return NULL on an empty list; it returns a
> wild pointer computed by container_of() on the list head, and
> dereferencing it corrupts memory. vdec_vp8_if.c has three unguarded
> list_first_entry() calls on inst->available_fb_node_list: two in
> vp8_dec_finish() (one unconditional, one on the show_frame path) and
> one in add_fb_to_free_list(). The pool holds a fixed number of nodes
> (VP8_MAX_FRM_BUF_NODE_NUM =3D 10) prefilled by init_list(), nodes leave
> the pool on every successful decode (two per show_frame decode and via
> the vpu error / resolution-change paths), and they are returned to the
> pool only through the userspace-driven get_disp_fb()/get_free_fb()
> calls -- which themselves use list_first_entry_or_null(), i.e. the
> driver already treats the pool as exhaustible on the return path but
> not on the take paths. If the VPU firmware keeps reporting a stale or
> zero prev_y_dma, or if userspace decodes more frames than it
> reclaims, the pool is exhausted and the next list_first_entry()
> returns a wild pointer into struct vdec_vp8_inst, after which
> node->fb =3D ... and list_move_tail() perform an in-structure
> out-of-bounds write and list corruption. This was found by code
> audit; we do not have a reproducer on real hardware.
>=20
> Fix this by switching the three take sites to
> list_first_entry_or_null() and bailing out when the pool is empty,
> matching the existing style of get_disp_fb()/get_free_fb() in the same
> file. On exhaustion vp8_dec_finish() now logs an error and stops
> tracking the frame instead of corrupting memory, and
> add_fb_to_free_list() simply drops the buffer.

Can you reduce this in your next version. Please start with stating what yo=
u
fix, such as "Fix possible null derefence", drop the "possible" if you can
actually reproduce. And then explain if needed. This iteration is just too =
much
and to hard to parse (in comparison to the actual code change).

>=20
> Reported-by: Wang Haoran <haoranwangsec@gmail.com>
> Reported-by: Li Ximo <lixicaicai@gmail.com>
> Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
> ---
>  .../vcodec/decoder/vdec/vdec_vp8_if.c         | 22 ++++++++++++++-----
>  1 file changed, 16 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8=
_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
> index fd15d462b..ba34c71f7 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
> @@ -308,15 +308,23 @@ static void vp8_dec_finish(struct vdec_vp8_inst *in=
st)
>  	}
> =20
>  	/* available_fb_node_list -> fb_use_list */
> -	node =3D list_first_entry(&inst->available_fb_node_list,
> -				struct vdec_fb_node, list);
> +	node =3D list_first_entry_or_null(&inst->available_fb_node_list,
> +					struct vdec_fb_node, list);
> +	if (!node) {
> +		mtk_vdec_err(inst->ctx, "no available fb node");
> +		return;
> +	}
>  	node->fb =3D inst->cur_fb;
>  	list_move_tail(&node->list, &inst->fb_use_list);
> =20
>  	/* available_fb_node_list -> fb_disp_list */
>  	if (inst->vsi->dec.show_frame) {
> -		node =3D list_first_entry(&inst->available_fb_node_list,
> -					struct vdec_fb_node, list);
> +		node =3D list_first_entry_or_null(&inst->available_fb_node_list,
> +						struct vdec_fb_node, list);
> +		if (!node) {
> +			mtk_vdec_err(inst->ctx, "no available fb node");
> +			return;
> +		}
>  		node->fb =3D inst->cur_fb;
>  		list_move_tail(&node->list, &inst->fb_disp_list);
>  	}
> @@ -352,8 +360,10 @@ static void add_fb_to_free_list(struct vdec_vp8_inst=
 *inst, void *fb)
>  	struct vdec_fb_node *node;
> =20
>  	if (fb) {
> -		node =3D list_first_entry(&inst->available_fb_node_list,
> -					struct vdec_fb_node, list);
> +		node =3D list_first_entry_or_null(&inst->available_fb_node_list,
> +						struct vdec_fb_node, list);
> +		if (!node)
> +			return;
>  		node->fb =3D fb;
>  		list_move_tail(&node->list, &inst->fb_free_list);
>  	}

--=-uJ4gl++ULVroAHyp7KGb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCauoBWAAKCRDZQZRRKWBy
9K1XAP9+wProaPl5Sh+BN2YDmMIpmtLgJeDUNc+Rd5rSiobFQwD/eerhOiLxNmww
zCdHfDHNqNRcRBpUTRv0WffZh2CZIwg=
=n6je
-----END PGP SIGNATURE-----

--=-uJ4gl++ULVroAHyp7KGb--
