Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AFA33BBC8
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 21:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775682709; cv=none; b=TD2rbdD693YjXCPPcuCsyai5vTft6NMmNgco/YCCvh7Ws7Oo1F+BGszyjBggxTgG2nfJ/2xykOvHyQtoXfmY7ENLaMowFgljs69x7ffPcb6LsDrHR7rG17kSZ4xf3WEKKVI5TJwasLoVojXYeKhVB/KlfhoMtH3d7Zk7bgsrbsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775682709; c=relaxed/simple;
	bh=eDwT1PpI7xC6SPLfZg81j8WoEhKHvgYMmiG9VZXDFLs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tpkuV7xIbzDV7bUNVZNV0UzQYXYJHt0Sx1s4WbNIExFFGEvF1uyVu3X+eJkSh32511hB1zFpE8TwTxDgm2zAyrlYgR9FaLA+iL5898jMpnnEGGSMDgKydgVqYgKS5iFdo452Iyk5z9KjUWqoCXlrJOlA/1zOluIOgnBADMWjjro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=CBa9drT2; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="CBa9drT2"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50b392f1846so3161101cf.3
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 14:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1775682706; x=1776287506; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TYisYVKIgGGZp3/zTu7AGT0ZWouISUGwxKducl0azG8=;
        b=CBa9drT2RrK39hzM1WO4hT104zJG3ELb+TR5kNFM9uIfD4GTmyzdGiSI1nlt7818RP
         h45IsqY6Ng6cyfJHBDga5FAF6kcMcC1kghnmVDVW8rXqzHlRt/zr0JeTG43YZcBTlxFQ
         InhQ4vuLYpCOafAOAZj+7w25oa+A4le7Wj7bztMIe8wjyfnty5NJ40qHY7XjVNxbt3PX
         IjRKEq+mKibG18muCZUF2YLnYEO9JoLSVsNcCXB141Oz6yLoupdkXA3ziHzg+6hK/kX1
         xV9V8Trchtl2OqtEv2EpX7SBmnZjgB5dyJrwWMBNJc3GBHt6i6VrBdk4YU3xNnnbjGw0
         SPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775682706; x=1776287506;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYisYVKIgGGZp3/zTu7AGT0ZWouISUGwxKducl0azG8=;
        b=tTY3LOYNSfyTbDmlgc+Btshlb+F+C018I+h0CuFV7AOLMzs2amTvwD9LdY4K6a9oDC
         HRUtVXxJ+kkjrb6NNwWFapqYUXw0xqJleyCEktmKjkGAlEg5nHIzDg26zSTS0yD0yMAk
         mVEFWkPQvGUhPsMPUhrpCNkT0SB+Fc/d772lR0AAjHdJeR8nSCdSRKJpm2C1S529UOnl
         e/IZLZnLoFKC2a2537OPL1ZiVwM3A4tO0OSFl34GnQ7p71KeVz1rtxW5X+Cgp/ntHLdl
         qI2ZJkXmv+xnEvCbWB6pFW4e50/8m28LL91+jyyqTF/1+XUcN2rZPl3N1gn79zim0cls
         ahcw==
X-Gm-Message-State: AOJu0YxejArUrKPojgCMXYztothsgIrhQtwm2uLjuotPY1f7fp/29oNc
	SQvKTXp0oxR10xEJK6DPkXpdUFmxGDlMBIGk2zrkKG5Sluf3/SunbUJSYgPokXUNyTU=
X-Gm-Gg: AeBDiet0LXznT3wh97zhj3Z/XKDHoIuiDlX22ClOc7A1zR/17m2eNPBZ0cXQSDfW9qF
	a7RZKmV1UGiBs1j+p7eYlGHm61eTMm4aoFcrsP9Nno0OKOIozzlvAQ+80KUnoLfFyLn+lIADiCa
	V6dG4Ah3v6+IRRLvExNA0ffrF+tP4AG3ytt/osqP6XJx5JiCXkDxxL+CBY93TRYZSkZr93pcJhH
	zdz5G4o0gHyABiJE2x9S5NZnM6GRkkhoDTmA+IQTx76zrlFAEUJQSLdVZAbPG3LnqIugGw3kMf9
	rj7rZRiqG2CONasSzTunka8vILW05noJGsbZ5zOaLV+U1DCjt2PC7wWkkEtplArX+GXruD6RWRc
	yrLVFY1HO4k8PnoxRiAmCQsPtEhWWN6QboikaqSzWm5bOexZFqAE5dY1fed/Epa0weAhiXk7uy5
	BgqH6nOQ3Br11xJYla4ahhKFVagnYfDLPCVWOX1is=
X-Received: by 2002:a05:622a:5a9a:b0:50d:7135:5631 with SMTP id d75a77b69052e-50dc21086b5mr14502351cf.6.1775682706003;
        Wed, 08 Apr 2026 14:11:46 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b885b69sm170660741cf.22.2026.04.08.14.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 14:11:45 -0700 (PDT)
Message-ID: <8911674f2f86a4b75e1f44d6e9b66a28f6e74e56.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 1/7] media: v4l2-ctrls: Add V4L2_CID_MEMORY_USAGE
 control
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, Frank Li <Frank.li@nxp.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, 	sebastian.fricke@collabora.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, 	kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com, 
	eagle.zhou@nxp.com, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Wed, 08 Apr 2026 17:11:44 -0400
In-Reply-To: <5c24fe3f-a1c7-4fd6-b5e6-c920bc3e7fcb@oss.nxp.com>
References: <20260331072347.253-1-ming.qian@oss.nxp.com>
	 <20260331072347.253-2-ming.qian@oss.nxp.com>
	 <acvbOo17tU-s20BS@lizhi-Precision-Tower-5810>
	 <079b1630abe5dd22e032797fc12925c9c79ea305.camel@ndufresne.ca>
	 <d8c12ba1-5004-4a51-8a2b-3d500184778b@oss.nxp.com>
	 <5c24fe3f-a1c7-4fd6-b5e6-c920bc3e7fcb@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-GjVrQf050XDh72y8B2Co"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-GjVrQf050XDh72y8B2Co
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 02 avril 2026 =C3=A0 11:14 +0800, Ming Qian(OSS) a =C3=A9crit=C2=
=A0:
> Hi Nicolas,
>=20
> On 4/1/2026 10:23 AM, Ming Qian(OSS) wrote:
> > Hi Nicolas,
> >=20
> > On 3/31/2026 10:54 PM, Nicolas Dufresne wrote:
> > > Le mardi 31 mars 2026 =C3=A0 10:33 -0400, Frank Li a =C3=A9crit :
> > > > On Tue, Mar 31, 2026 at 03:23:11PM +0800, ming.qian@oss.nxp.com=C2=
=A0wrote:
> > > > > From: Ming Qian <ming.qian@oss.nxp.com>
> > > > >=20
> > > > > Add a new read-only control V4L2_CID_MEMORY_USAGE that allows
> > > > > applications to query the total amount of memory currently used
> > > > > by a device instance.
> > > > >=20
> > > > > This control reports the memory consumption in bytes, including
> > > > > internal buffers, intermediate processing data, and other
> > > > > driver-managed allocations. Applications can use this information
> > > > > for debugging, resource monitoring, or making informed decisions
> > > > > about buffer allocation strategies.
> > > > >=20
> > > > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > > > > ---
> > > >=20
> > > > Not sure why not export these information by debugfs, or any benefi=
t vs
> > > > debugfs?
> > >=20
> > > There is also a on-going proposal that uses fdinfo.
> > >=20
> > > Nicolas
> > >=20
> >=20
> > Thanks for the reminder about the ongoing fdinfo proposal.
> >=20
> > Just to confirm, you are referring to Detlev=E2=80=99s ongoing fdinfo p=
roposal,
> > specifically this series:
> > https://lore.kernel.org/lkml/20260212162328.192217-1-=20
> > detlev.casanova@collabora.com/
> >=20
> > I will align my work with it and switch to using fdinfo.
> > Once the show_fdinfo support from that series is merged, I will prepare
> > the next revision of my patch accordingly.
> >=20
> > Regards,
> > Ming
> >=20
>=20
> Regarding the discussion about using fdinfo instead of a V4L2 control, I
> have two questions:
>=20
> 	1. Key consistency in fdinfo
> 	fdinfo uses key=E2=80=93value pairs, which is flexible, but if multiple
> 	drivers want to expose the same =E2=80=9Cmemory usage=E2=80=9D informati=
on,
> 	they need to agree on a common key name and meaning. Otherwise
> 	user=E2=80=91space must handle each driver differently. A V4L2 control
> 	naturally provides a unified interface without this coordination
> 	effort.
>=20
>=20
> 	2. Lack of notification in fdinfo
> 	With a control, user=E2=80=91space can subscribe to control events and
> 	receive notifications when the memory usage changes. fdinfo does
> 	not have a built=E2=80=91in event mechanism, so users must either poll
> 	or rely on additional eventfd=E2=80=91like or custom event mechanisms.
>=20
> Do you have any suggestions or existing practices to address these two
> issues when using fdinfo?
>=20
> Thanks again for your time and comments.

Added Detlev in CC. You can also refer to his work through:

https://lore.kernel.org/all/20260212162328.192217-1-detlev.casanova@collabo=
ra.com/

Nicolas

>=20
> Regards,
> Ming
>=20
> > > >=20
> > > > Generanlly document should be first patch, then driver change.
> > > >=20
> > > > Frank
> > > >=20
> > > > > =C2=A0 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 8 ++++++++
> > > > > =C2=A0 include/uapi/linux/v4l2-controls.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 4 +++-
> > > > > =C2=A0 2 files changed, 11 insertions(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/=
=20
> > > > > media/v4l2-core/v4l2-ctrls-defs.c
> > > > > index 551426c4cd01..053db78ff661 100644
> > > > > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > > > @@ -831,6 +831,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_CID_ALPHA_COMPONENT:=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "Alpha Component";
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_CID_COLORFX_CBCR:=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "Color Effects, CbCr";
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_CID_COLORFX_RGB:=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn "Color Effects,=20
> > > > > RGB";
> > > > > +=C2=A0=C2=A0=C2=A0 case V4L2_CID_MEMORY_USAGE:=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return "Memory Usage";
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Codec controls
> > > > > @@ -1476,6 +1477,13 @@ void v4l2_ctrl_fill(u32 id, const char=20
> > > > > **name, enum v4l2_ctrl_type *type,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *min =3D 0=
;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *max =3D 0=
xffff;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > +=C2=A0=C2=A0=C2=A0 case V4L2_CID_MEMORY_USAGE:
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *type =3D V4L2_CTRL_T=
YPE_INTEGER64;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *flags |=3D V4L2_CTRL=
_FLAG_READ_ONLY;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *min =3D 0;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *max =3D S64_MAX;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *step =3D 1;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_CID_FLASH_FAULT:
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_CID_JPEG_ACTIVE_MARKER:
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_CID_3A_LOCK:
> > > > > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/=
=20
> > > > > linux/v4l2-controls.h
> > > > > index 68dd0c4e47b2..02c6f960d38e 100644
> > > > > --- a/include/uapi/linux/v4l2-controls.h
> > > > > +++ b/include/uapi/linux/v4l2-controls.h
> > > > > @@ -110,8 +110,10 @@ enum v4l2_colorfx {
> > > > > =C2=A0 #define V4L2_CID_COLORFX_CBCR=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (V4L2_CID_BASE+42)
> > > > > =C2=A0 #define V4L2_CID_COLORFX_RGB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (V4L2_CID_BASE+43)
> > > > >=20
> > > > > +#define V4L2_CID_MEMORY_USAGE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (V4L2_CID_BASE+44)
> > > > > +
> > > > > =C2=A0 /* last CID + 1 */
> > > > > -#define V4L2_CID_LASTP1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (V4L2_CID_BASE+44)
> > > > > +#define V4L2_CID_LASTP1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (V4L2_CID_BASE+45)
> > > > >=20
> > > > > =C2=A0 /* USER-class private control IDs */
> > > > >=20
> > > > > --=20
> > > > > 2.53.0
> > > > >=20
> >=20

--=-GjVrQf050XDh72y8B2Co
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCadbEkAAKCRDZQZRRKWBy
9IqwAP4yeegqeo+AHSiM1jVlhyqY9eqH63qFPvFTBJmnvaPAbwEA5Z5akB+DPZtG
ORNAuAa1vDoUmjl3VtozF6mFzAZBxgM=
=Xjjv
-----END PGP SIGNATURE-----

--=-GjVrQf050XDh72y8B2Co--
