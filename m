Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F462C21F0;
	Thu, 16 Jul 2026 00:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784163034; cv=none; b=bGyNhNt/2M65Dpg1qFeCVxOjrCIQIgg7+WuO8UKE9QGbsVEW/BA+X0xkWNZoB61b1qZtv6GDtmQ5U6SaY2ot0JD9hGMM1ErBBzfWwuI5kDrYv60x6HF6uW9Y3iUnvlvvWU2PfTC67Ykk8bezCAAD9pEVJmeL3e5Jo80RkUJvlCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784163034; c=relaxed/simple;
	bh=i3wzK/2CZLjfYK0dabcw+O15PTqu0KXSSvMhDzqhSG0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Yt333XldSoq3ES2MPd1owHbefXulg5QKRS6XRtEFtUxVy2W0eZIwRHmRq46msRQE6UYGywodQNoBme7x1u2oGlxUUOs4/PTDD7MaDsFzBSc3jIVJrUBij1y8mj9qzcn4ekbxfFNMZY5VaVkfnCEtoupzbzWt7o2JFGOYv6rGvjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=I7YWmMzh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="I7YWmMzh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784163029;
	bh=i3wzK/2CZLjfYK0dabcw+O15PTqu0KXSSvMhDzqhSG0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=I7YWmMzhFn7OsYKprSKoQ/RrRHnYOIM4/KohDFsFeTqI66lvNL1qKXh/N+QTCuLle
	 nBMGYxNoyZWHFjdWc9trM/MOQLQ2FTjfVluogBbYWvOUt0obz57rDdlTVioiiC6lBJ
	 onpZWqrBr4uOPSBZ+s6ORM6ehAfHp6nIoXxTZBnqbuSjYdFmXyEMbOdZYxAOwZ8xCF
	 mTNwk16bsvuxK68JDfk/4Ms1Qk9tnNiXAAVorpklL6BM34fSHTeTt6508HjkhY1PFF
	 bp3m/TwNoMtOsnPpjYxDwi5aFt3YWpT4IYic4oil/YKbD+/sZtLVxUD1jC1VOeADi5
	 jew1tHOqyvRcA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6159117E087B;
	Thu, 16 Jul 2026 02:50:25 +0200 (CEST)
Message-ID: <2dad1d32f59b271e9cf53f0da71b584e2e04a889.camel@collabora.com>
Subject: Re: [PATCH v5 02/14] media: mediatek: vcodec: add driver to support
 vcp
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Ricardo Ribalda	
 <ribalda@chromium.org>, Kees Cook <kees@kernel.org>, Hans Verkuil	
 <hverkuil+cisco@kernel.org>, Haoxiang Li <haoxiang_li2024@163.com>, Fei
 Shao	 <fshao@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, Laurent
 Pinchart	 <laurent.pinchart+renesas@ideasonboard.com>, Sebastian Fricke	
 <sebastian.fricke@collabora.com>, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Qianfeng Rong <rongqianfeng@vivo.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Irui Wang	 <irui.wang@mediatek.com>, Fan
 Wu <fanwu01@zju.edu.cn>, 	linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Tzung-Bi Shih
	 <tzungbi@kernel.org>, Tomasz Figa <tfiga@chromium.org>
Date: Wed, 15 Jul 2026 20:50:23 -0400
In-Reply-To: <20260603084045.17488-3-kyrie.wu@mediatek.com>
References: <20260603084045.17488-1-kyrie.wu@mediatek.com>
	 <20260603084045.17488-3-kyrie.wu@mediatek.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-GogitkVNMOTwu37Eb8w7"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-GogitkVNMOTwu37Eb8w7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 03 juin 2026 =C3=A0 16:40 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> From: Yunfei Dong <yunfei.dong@mediatek.com>
>=20
> The processor is changed from scp to vcp in mt8196 platform.
> Adding new firmware interface to communicate kernel with vcp
> for the communication method is changed.
>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> =C2=A0.../media/platform/mediatek/vcodec/Kconfig=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 4 +
> =C2=A0.../platform/mediatek/vcodec/common/Makefile=C2=A0 |=C2=A0=C2=A0 4 =
+
> =C2=A0.../mediatek/vcodec/common/mtk_vcodec_fw.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 26 +-
> =C2=A0.../vcodec/common/mtk_vcodec_fw_priv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 12 +
> =C2=A0.../vcodec/common/mtk_vcodec_fw_scp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0.../vcodec/common/mtk_vcodec_fw_vcp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 505 ++++++++++++++++++
> =C2=A0.../vcodec/common/mtk_vcodec_fw_vcp.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 142 +++++
> =C2=A0.../vcodec/common/mtk_vcodec_fw_vpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0.../vcodec/encoder/mtk_vcodec_enc_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0.../vcodec/encoder/mtk_vcodec_enc_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A012 files changed, 691 insertions(+), 13 deletions(-)
> =C2=A0create mode 100644 drivers/media/platform/mediatek/vcodec/common/mt=
k_vcodec_fw_vcp.c
> =C2=A0create mode 100644 drivers/media/platform/mediatek/vcodec/common/mt=
k_vcodec_fw_vcp.h
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/Kconfig b/drivers/med=
ia/platform/mediatek/vcodec/Kconfig
> index bc8292232530..d23dad5c78ce 100644
> --- a/drivers/media/platform/mediatek/vcodec/Kconfig
> +++ b/drivers/media/platform/mediatek/vcodec/Kconfig
> @@ -1,4 +1,7 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_MEDIATEK_VCODEC_VCP
> +	bool
> +
> =C2=A0config VIDEO_MEDIATEK_VCODEC_SCP
> =C2=A0	bool
> =C2=A0
> @@ -21,6 +24,7 @@ config VIDEO_MEDIATEK_VCODEC
> =C2=A0	select V4L2_MEM2MEM_DEV
> =C2=A0	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
> =C2=A0	select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
> +	select VIDEO_MEDIATEK_VCODEC_VCP if MTK_VCP_RPROC
> =C2=A0	select V4L2_H264
> =C2=A0	select V4L2_VP9
> =C2=A0	select MEDIA_CONTROLLER
> diff --git a/drivers/media/platform/mediatek/vcodec/common/Makefile b/dri=
vers/media/platform/mediatek/vcodec/common/Makefile
> index d0479914dfb3..2f68692e8c98 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/Makefile
> +++ b/drivers/media/platform/mediatek/vcodec/common/Makefile
> @@ -14,6 +14,10 @@ ifneq ($(CONFIG_VIDEO_MEDIATEK_VCODEC_SCP),)
> =C2=A0mtk-vcodec-common-y +=3D mtk_vcodec_fw_scp.o
> =C2=A0endif
> =C2=A0
> +ifneq ($(CONFIG_VIDEO_MEDIATEK_VCODEC_VCP),)
> +mtk-vcodec-common-y +=3D mtk_vcodec_fw_vcp.o
> +endif
> +
> =C2=A0ifneq ($(CONFIG_DEBUG_FS),)
> =C2=A0obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) +=3D mtk-vcodec-dbgfs.o
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.=
c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
> index 08949b08fbc6..64977bcd6abd 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
> @@ -3,26 +3,26 @@
> =C2=A0#include "../decoder/mtk_vcodec_dec_drv.h"
> =C2=A0#include "../encoder/mtk_vcodec_enc_drv.h"
> =C2=A0#include "mtk_vcodec_fw_priv.h"
> +#include "mtk_vcodec_fw_vcp.h"
> =C2=A0
> =C2=A0struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vco=
dec_fw_type type,
> =C2=A0					=C2=A0=C2=A0 enum mtk_vcodec_fw_use fw_use)
> =C2=A0{
> -	struct platform_device *plat_dev;
> +	if (fw_use =3D=3D ENCODER) {
> +		struct mtk_vcodec_enc_dev *enc_dev =3D priv;
> =C2=A0
> -	if (fw_use =3D=3D ENCODER)
> -		plat_dev =3D ((struct mtk_vcodec_enc_dev *)priv)->plat_dev;
> -	else
> -		plat_dev =3D ((struct mtk_vcodec_dec_dev *)priv)->plat_dev;
> +		return enc_dev->fw_init(priv, fw_use);
> +	}
> +
> +	if (fw_use =3D=3D DECODER) {

Should we construct this a little safer and use some if/else if/else with s=
ome
bug_on in the last entry, or same with a switch ?

> +		struct mtk_vcodec_dec_dev *dec_dev =3D priv;
> =C2=A0
> -	switch (type) {
> -	case VPU:
> -		return mtk_vcodec_fw_vpu_init(priv, fw_use);
> -	case SCP:
> -		return mtk_vcodec_fw_scp_init(priv, fw_use);
> -	default:
> -		dev_err(&plat_dev->dev, "Invalid vcodec fw type");
> -		return ERR_PTR(-EINVAL);
> +		return dec_dev->fw_init(priv, fw_use);
> =C2=A0	}
> +
> +	pr_err("Error in selecting firmware, fw_use is not set");
> +
> +	return ERR_PTR(-EINVAL);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(mtk_vcodec_fw_select);
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
priv.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
> index 99603accd82e..0a2a9b010244 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
> @@ -4,6 +4,7 @@
> =C2=A0#define _MTK_VCODEC_FW_PRIV_H_
> =C2=A0
> =C2=A0#include "mtk_vcodec_fw.h"
> +#include "mtk_vcodec_fw_vcp.h"
> =C2=A0
> =C2=A0struct mtk_vcodec_dec_dev;
> =C2=A0struct mtk_vcodec_enc_dev;
> @@ -13,6 +14,7 @@ struct mtk_vcodec_fw {
> =C2=A0	const struct mtk_vcodec_fw_ops *ops;
> =C2=A0	struct platform_device *pdev;
> =C2=A0	struct mtk_scp *scp;
> +	struct mtk_vcp *vcp;
> =C2=A0	enum mtk_vcodec_fw_use fw_use;
> =C2=A0};
> =C2=A0
> @@ -49,4 +51,14 @@ mtk_vcodec_fw_scp_init(void *priv, enum mtk_vcodec_fw_=
use fw_use)
> =C2=A0}
> =C2=A0#endif /* CONFIG_VIDEO_MEDIATEK_VCODEC_SCP */
> =C2=A0
> +#if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VCODEC_VCP)
> +struct mtk_vcodec_fw *mtk_vcodec_fw_vcp_init(void *priv, enum mtk_vcodec=
_fw_use fw_use);
> +#else
> +static inline struct mtk_vcodec_fw *
> +mtk_vcodec_fw_vcp_init(void *priv, enum mtk_vcodec_fw_use fw_use)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +#endif /* CONFIG_VIDEO_MEDIATEK_VCODEC_VCP */
> +
> =C2=A0#endif /* _MTK_VCODEC_FW_PRIV_H_ */
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
scp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> index 1b0bc47355c0..1aad5c3ef990 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> @@ -90,3 +90,4 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *priv=
, enum mtk_vcodec_fw_use
> =C2=A0
> =C2=A0	return fw;
> =C2=A0}
> +EXPORT_SYMBOL_GPL(mtk_vcodec_fw_scp_init);
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> new file mode 100644
> index 000000000000..2f3bfcd97958
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> @@ -0,0 +1,505 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + * Author: Yunfei Dong <yunfei.dong@mediatek.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/dma-direction.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/iommu.h>
> +#include <linux/remoteproc/mtk_vcp_public.h>
> +#include <linux/firmware/mediatek/mtk-vcp-ipc.h>
> +
> +#include "../decoder/mtk_vcodec_dec_drv.h"
> +#include "../decoder/vdec_ipi_msg.h"
> +#include "mtk_vcodec_fw_priv.h"
> +
> +#define IPI_SEND_TIMEOUT_MS=C2=A0 100U
> +#define IPI_TIMEOUT_MS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 100U
> +
> +#define VCP_IPI_HEADER_SIZE (sizeof(u32) * 2)
> +#define VCP_IPI_ALIGN (4)
> +
> +static struct mutex *mtk_vcodec_vcp_get_ipi_lock(struct mtk_vcp *vcp, u3=
2 ipi_id)
> +{
> +	return &vcp->ipi_desc[ipi_id].lock;

Maybe add sound bound checks ?

> +}
> +
> +static void mtk_vcodec_vcp_ipi_lock(struct mtk_vcp *vcp, u32 ipi_id)
> +{
> +	struct mutex *lock =3D mtk_vcodec_vcp_get_ipi_lock(vcp, ipi_id);
> +
> +	if (!lock)
> +		return;

mtk_vcodec_vcp_get_ipi_lock() nevers return null at the minute.

> +
> +	mutex_lock(lock);
> +}
> +
> +static void mtk_vcodec_vcp_ipi_unlock(struct mtk_vcp *vcp, u32 ipi_id)
> +{
> +	struct mutex *lock =3D mtk_vcodec_vcp_get_ipi_lock(vcp, ipi_id);
> +
> +	if (!lock)
> +		return;
> +
> +	lockdep_assert_held(lock);
> +	mutex_unlock(lock);
> +}
> +
> +static spinlock_t *mtk_vcodec_vcp_get_msg_queue_lock(struct mtk_vcodec_f=
w *fw)
> +{
> +	return &fw->vcp->msg_queue.lock;
> +}
> +
> +static void mtk_vcodec_vcp_msq_queue_lock(struct mtk_vcodec_fw *fw, unsi=
gned long *flags)
> +{
> +	spinlock_t *lock =3D mtk_vcodec_vcp_get_msg_queue_lock(fw);
> +
> +	if (!lock)
> +		return;

mtk_vcodec_vcp_get_msg_queue_lock() never returns null.

> +
> +	spin_lock_irqsave(lock, *flags);
> +}
> +
> +static void mtk_vcodec_vcp_msq_queue_unlock(struct mtk_vcodec_fw *fw, un=
signed long *flags)
> +{
> +	spinlock_t *lock =3D mtk_vcodec_vcp_get_msg_queue_lock(fw);
> +
> +	if (!lock)
> +		return;
> +
> +	spin_unlock_irqrestore(lock, *flags);
> +}
> +
> +static int mtk_vcodec_vcp_notifier(struct notifier_block *nb, unsigned l=
ong event, void *ptr)
> +{
> +	struct mtk_vcp *vcp =3D container_of(nb, struct mtk_vcp, vcp_notify);
> +
> +	switch (event) {
> +	case VCP_EVENT_SUSPEND:
> +	case VCP_EVENT_STOP:
> +		dev_dbg(&vcp->pdev->dev, "vcp notifier suspend");
> +		break;
> +	case VCP_EVENT_READY:
> +	case VCP_EVENT_RESUME:
> +		dev_dbg(&vcp->pdev->dev, "vcp notifier ready");
> +		break;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static void mtk_vcodec_vcp_free_msg_node(struct mtk_vcodec_fw *fw,
> +					 struct mtk_vcp_msg_node *msg_node)
> +{
> +	unsigned long flags;
> +
> +	mtk_vcodec_vcp_msq_queue_lock(fw, &flags);
> +	list_add(&msg_node->list, &fw->vcp->msg_queue.node_list);
> +	mtk_vcodec_vcp_msq_queue_unlock(fw, &flags);
> +}
> +
> +static int mtk_vcodec_vcp_ipi_register(struct mtk_vcp *vcp, u32 ipi_id, =
vcp_ipi_handler_t handler,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *priv)
> +{
> +	if (!vcp)
> +		return -EPROBE_DEFER;
> +
> +	if (WARN_ON(ipi_id >=3D VCP_IPI_MAX) || WARN_ON(!handler))
> +		return -EINVAL;

Ok, fair enough as a bound check I guess, thought the get/null-check constr=
uct
still make no sense.

Stopping there, I'm on a time crunch, but considering the dependencies aren=
't
met, feel free to ping me again for more reviews.

Nicolas

> +
> +	mtk_vcodec_vcp_ipi_lock(vcp, ipi_id);
> +	vcp->ipi_desc[ipi_id].handler =3D handler;
> +	vcp->ipi_desc[ipi_id].priv =3D priv;
> +	mtk_vcodec_vcp_ipi_unlock(vcp, ipi_id);
> +
> +	return 0;
> +}
> +
> +static int mtk_vcodec_vcp_msg_process_thread(void *arg)
> +{
> +	struct mtk_vcodec_fw *fw =3D arg;
> +	struct vdec_vpu_ipi_ack *msg =3D NULL;
> +	struct mtk_vcp_share_obj *obj;
> +	struct mtk_vcp_msg_node *msg_node;
> +	vcp_ipi_handler_t handler;
> +	unsigned long flags;
> +	int ret =3D 0;
> +
> +	do {
> +		ret =3D wait_event_interruptible(fw->vcp->msg_queue.wq,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 atomic_read(&fw->vcp->msg_queu=
e.cnt) > 0);
> +		if (ret < 0) {
> +			dev_err(&fw->pdev->dev, "wait msg queue ack timeout %d %d\n",
> +				ret, atomic_read(&fw->vcp->msg_queue.cnt));
> +			continue;
> +		}
> +
> +		mtk_vcodec_vcp_msq_queue_lock(fw, &flags);
> +		msg_node =3D list_entry(fw->vcp->msg_queue.msg_list.next,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mtk_vcp_msg_node, list);
> +		list_del(&msg_node->list);
> +		atomic_dec(&fw->vcp->msg_queue.cnt);
> +		mtk_vcodec_vcp_msq_queue_unlock(fw, &flags);
> +
> +		obj =3D &msg_node->ipi_data;
> +		msg =3D (struct vdec_vpu_ipi_ack *)obj->share_buf;
> +
> +		if (!msg->ap_inst_addr) {
> +			dev_err(&fw->pdev->dev, "invalid message address\n");
> +			mtk_vcodec_vcp_free_msg_node(fw, msg_node);
> +			continue;
> +		}
> +
> +		dev_dbg(&fw->pdev->dev, "msg ack id %d len %d msg_id 0x%x\n", obj->id,=
 obj->len,
> +			msg->msg_id);
> +
> +		mtk_vcodec_vcp_ipi_lock(fw->vcp, obj->id);
> +		handler =3D fw->vcp->ipi_desc[obj->id].handler;
> +		if (!handler) {
> +			dev_err(&fw->pdev->dev, "invalid ack ipi handler id =3D %d\n", obj->i=
d);
> +			mtk_vcodec_vcp_ipi_unlock(fw->vcp, obj->id);
> +			mtk_vcodec_vcp_free_msg_node(fw, msg_node);
> +			return -EINVAL;
> +		}
> +
> +		handler(msg, obj->len, fw->vcp->ipi_desc[obj->id].priv);
> +		mtk_vcodec_vcp_ipi_unlock(fw->vcp, obj->id);
> +
> +		fw->vcp->msg_signaled[obj->id] =3D true;
> +		wake_up(&fw->vcp->msg_wq[obj->id]);
> +
> +		mtk_vcodec_vcp_free_msg_node(fw, msg_node);
> +	} while (!kthread_should_stop());
> +
> +	return ret;
> +}
> +
> +static int mtk_vcodec_vcp_msg_ack_isr(unsigned int id, void *prdata, voi=
d *data, unsigned int len)
> +{
> +	struct mtk_vcodec_fw *fw =3D prdata;
> +	struct mtk_vcp_msg_queue *msg_queue =3D &fw->vcp->msg_queue;
> +	struct mtk_vcp_msg_node *msg_node;
> +	struct vdec_vpu_ipi_ack *msg =3D NULL;
> +	struct mtk_vcp_share_obj *obj =3D data;
> +	unsigned long flags;
> +
> +	msg =3D (struct vdec_vpu_ipi_ack *)obj->share_buf;
> +
> +	mtk_vcodec_vcp_msq_queue_lock(fw, &flags);
> +	if (!list_empty(&msg_queue->node_list)) {
> +		msg_node =3D list_entry(msg_queue->node_list.next, struct mtk_vcp_msg_=
node, list);
> +
> +		memcpy(&msg_node->ipi_data, obj, sizeof(*obj));
> +		list_move_tail(&msg_node->list, &msg_queue->msg_list);
> +		atomic_inc(&msg_queue->cnt);
> +		mtk_vcodec_vcp_msq_queue_unlock(fw, &flags);
> +
> +		dev_dbg(&fw->pdev->dev, "push ipi_id %x msg_id %x, msg cnt %d\n",
> +			obj->id, msg->msg_id, atomic_read(&msg_queue->cnt));
> +
> +		wake_up(&msg_queue->wq);
> +	} else {
> +		mtk_vcodec_vcp_msq_queue_unlock(fw, &flags);
> +		dev_err(&fw->pdev->dev, "no free nodes in msg queue\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_vcodec_vcp_msg_ipi_send(struct mtk_vcodec_fw *fw, int id,=
 void *buf,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int len, unsigned int =
wait)
> +{
> +	struct mtk_vcp *vcp =3D fw->vcp;
> +	struct mtk_vcp_device *vcp_device =3D vcp->vcp_device;
> +	bool *msg_signaled =3D &vcp->msg_signaled[id];
> +	wait_queue_head_t *msg_wq =3D &vcp->msg_wq[id];
> +	int ret, ipi_size, feature_id, mailbox_id, retry_cnt =3D 0;
> +	unsigned long timeout_jiffies =3D 0;
> +	struct mtk_vcp_share_obj obj =3D {0};
> +	unsigned int *data;
> +
> +	if (!vcp_device) {
> +		dev_dbg(&fw->pdev->dev, "vcp device is null\n");
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&vcp->ipi_mutex);
> +	feature_id =3D VDEC_FEATURE_ID;
> +	mailbox_id =3D IPI_OUT_VDEC_1;
> +
> +	timeout_jiffies =3D jiffies + msecs_to_jiffies(VCP_SYNC_TIMEOUT_MS);
> +	while (!vcp_device->ops->vcp_is_ready(feature_id)) {
> +		if (time_after(jiffies, timeout_jiffies)) {
> +			vcp->ipi_id_ack[id] =3D -EINVAL;
> +			ret =3D -EINVAL;
> +			goto error;
> +		}
> +		mdelay(1);
> +	}
> +
> +	if (len > VCP_SHARE_BUF_SIZE) {
> +		vcp->ipi_id_ack[id] =3D -EINVAL;
> +		ret =3D -EINVAL;
> +		goto error;
> +	}
> +
> +	obj.id =3D id;
> +	obj.len =3D len;
> +	memcpy(obj.share_buf, buf, len);
> +
> +	ipi_size =3D round_up(VCP_IPI_HEADER_SIZE + len, VCP_IPI_ALIGN);
> +	data =3D (unsigned int *)obj.share_buf;
> +	dev_dbg(&fw->pdev->dev, "vcp send message: id %d len %d data 0x%x\n",
> +		obj.id, obj.len, data[0]);
> +
> +	ret =3D mtk_vcp_ipc_send(vcp_get_ipidev(vcp_device), mailbox_id, &obj, =
ipi_size);
> +	if (ret !=3D IPI_ACTION_DONE) {
> +		vcp->ipi_id_ack[id] =3D -EIO;
> +		ret =3D -EIO;
> +		goto error;
> +	}
> +
> +wait_ack:
> +	/* wait for VCP's ACK */
> +	ret =3D wait_event_timeout(*msg_wq, *msg_signaled, msecs_to_jiffies(IPI=
_TIMEOUT_MS));
> +	if (!ret || retry_cnt > 5) {
> +		vcp->ipi_id_ack[id] =3D VCODEC_IPI_MSG_STATUS_FAIL;
> +		dev_err(&fw->pdev->dev, "wait ipi ack timeout! %d %d\n", ret, vcp->ipi=
_id_ack[id]);
> +	} else if (ret =3D=3D -ERESTARTSYS) {
> +		dev_err(&fw->pdev->dev, "wait ipi ack err (%d)\n", vcp->ipi_id_ack[id]=
);
> +		retry_cnt++;
> +		goto wait_ack;
> +	} else if (ret < 0) {
> +		dev_err(&fw->pdev->dev, "wait ipi ack fail ret %d %d\n", ret, vcp->ipi=
_id_ack[id]);
> +		vcp->ipi_id_ack[id] =3D VCODEC_IPI_MSG_STATUS_FAIL;
> +	}
> +
> +	dev_dbg(&fw->pdev->dev, "receive message: id %d len %d data 0x%x\n",
> +		obj.id, obj.len, data[0]);
> +
> +	*msg_signaled =3D false;
> +	mutex_unlock(&vcp->ipi_mutex);
> +
> +	return vcp->ipi_id_ack[id];
> +
> +error:
> +	mutex_unlock(&vcp->ipi_mutex);
> +	dev_err(&fw->pdev->dev, "send msg error type:%d msg:%d > %d ret:%d\n", =
fw->type, len,
> +		VCP_SHARE_BUF_SIZE, ret);
> +
> +	return ret;
> +}
> +
> +static int check_vcp_loaded(struct mtk_vcodec_fw *fw)
> +{
> +	struct device *dev =3D &fw->pdev->dev;
> +	struct device_driver *drv;
> +
> +	drv =3D driver_find("mtk-vcp", &platform_bus_type);
> +	if (!drv) {
> +		dev_err(dev, "find mtk-vcp driver failed, need to reload.");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_vcodec_vcp_get_vcp_device(struct mtk_vcodec_fw *fw)
> +{
> +	struct device *dev =3D &fw->pdev->dev;
> +	int retry =3D 0, retry_cnt =3D 10000;
> +	phandle vcp_phandle;
> +
> +	while (try_then_request_module(check_vcp_loaded(fw), "mtk-vcp")) {
> +		if (++retry > retry_cnt) {
> +			dev_err(dev, "failed to load mtk-vcp module");
> +			return -EPROBE_DEFER;
> +		}
> +		usleep_range(1000, 2000);
> +	}
> +
> +	if (of_property_read_u32(dev->of_node, "mediatek,vcp", &vcp_phandle)) {
> +		dev_err(dev, "can't get vcp handle.\n");
> +		return -ENODEV;
> +	}
> +
> +	fw->vcp->vcp_device =3D mtk_vcp_get_by_phandle(vcp_phandle);
> +	if (!fw->vcp->vcp_device) {
> +		dev_err(dev, "get vcp device failed\n");
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_vcodec_vcp_load_firmware(struct mtk_vcodec_fw *fw)
> +{
> +	struct mtk_vcp_device *vcp_device;
> +	int ret, feature_id, mem_id, mailbox_id, ipi_id;
> +
> +	if (fw->vcp->is_init_done) {
> +		dev_dbg(&fw->pdev->dev, "vcp has already been initialized done.\n");
> +		return 0;
> +	}
> +
> +	if (mtk_vcodec_vcp_get_vcp_device(fw) < 0) {
> +		dev_err(&fw->pdev->dev, "vcp device is null.\n");
> +		return -EINVAL;
> +	}
> +
> +	vcp_device =3D fw->vcp->vcp_device;
> +
> +	feature_id =3D VDEC_FEATURE_ID;
> +	mem_id =3D VDEC_MEM_ID;
> +	mailbox_id =3D IPI_IN_VDEC_1;
> +	ipi_id =3D VCP_IPI_LAT_DECODER;
> +
> +	ret =3D mtk_vcp_mbox_ipc_register(vcp_get_ipidev(vcp_device), mailbox_i=
d,
> +					mtk_vcodec_vcp_msg_ack_isr, fw, &fw->vcp->share_data);
> +	if (ret) {
> +		dev_dbg(&fw->pdev->dev, "ipi register fail %d %d %d %d\n", ret, featur=
e_id,
> +			mem_id, mailbox_id);
> +		return -EINVAL;
> +	}
> +
> +	fw->vcp->vcp_notify.notifier_call =3D mtk_vcodec_vcp_notifier;
> +	fw->vcp->vcp_notify.priority =3D 1;
> +	vcp_device->ops->vcp_register_notify(feature_id, &fw->vcp->vcp_notify);
> +
> +	if (!fw->vcp->is_register_done) {
> +		ret =3D vcp_device->ops->vcp_register_feature(vcp_device, feature_id);
> +		if (ret < 0) {
> +			dev_err(&fw->pdev->dev, "%d register to vcp fail(%d)\n", feature_id, =
ret);
> +			return -EINVAL;
> +		}
> +
> +		fw->vcp->is_register_done =3D true;
> +	}
> +
> +	fw->vcp->is_init_done =3D true;
> +
> +	mutex_init(&fw->vcp->ipi_desc[ipi_id].lock);
> +	mutex_init(&fw->vcp->ipi_mutex);
> +
> +	kthread_run(mtk_vcodec_vcp_msg_process_thread, fw, "vcp_vdec_msq_thread=
");
> +
> +	fw->vcp->vsi_addr =3D vcp_device->ops->vcp_get_mem_virt(mem_id);
> +	fw->vcp->vsi_core_addr =3D fw->vcp->vsi_addr + VCODEC_VSI_LEN;
> +	fw->vcp->vsi_size =3D vcp_device->ops->vcp_get_mem_size(mem_id);
> +	fw->vcp->iova_addr =3D vcp_device->ops->vcp_get_mem_iova(mem_id);
> +
> +	init_waitqueue_head(&fw->vcp->msg_wq[VCP_IPI_LAT_DECODER]);
> +	init_waitqueue_head(&fw->vcp->msg_wq[VCP_IPI_CORE_DECODER]);
> +
> +	dev_dbg(&fw->pdev->dev, "vdec vcp init done =3D> va: %p size:0x%x iova:=
%p.\n",
> +		fw->vcp->vsi_addr, fw->vcp->vsi_size, &fw->vcp->iova_addr);
> +
> +	return 0;
> +}
> +
> +static unsigned int mtk_vcodec_vcp_get_vdec_capa(struct mtk_vcodec_fw *f=
w)
> +{
> +	return MTK_VDEC_FORMAT_MM21 | MTK_VDEC_FORMAT_H264_SLICE | MTK_VDEC_FOR=
MAT_VP9_FRAME |
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MTK_VDEC_FORMAT_AV1_FRAME | MTK_VD=
EC_FORMAT_HEVC_FRAME |
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MTK_VDEC_IS_SUPPORT_10BIT | MTK_VD=
EC_IS_SUPPORT_EXT;
> +}
> +
> +static void *mtk_vcodec_vcp_dm_addr(struct mtk_vcodec_fw *fw, u32 dtcm_d=
mem_addr)
> +{
> +	return NULL;
> +}
> +
> +static int mtk_vcodec_vcp_set_ipi_register(struct mtk_vcodec_fw *fw, int=
 id,
> +					=C2=A0=C2=A0 mtk_vcodec_ipi_handler handler,
> +					=C2=A0=C2=A0 const char *name, void *priv)
> +{
> +	return mtk_vcodec_vcp_ipi_register(fw->vcp, id, handler, priv);
> +}
> +
> +static int mtk_vcodec_vcp_ipi_send(struct mtk_vcodec_fw *fw, int id, voi=
d *buf,
> +				=C2=A0=C2=A0 unsigned int len, unsigned int wait)
> +{
> +	return mtk_vcodec_vcp_msg_ipi_send(fw, id, buf, len, wait);
> +}
> +
> +static void mtk_vcodec_vcp_release(struct mtk_vcodec_fw *fw)
> +{
> +	struct mtk_vcp_device *vcp_device =3D fw->vcp->vcp_device;
> +	struct device *dev =3D &fw->pdev->dev;
> +	int ret, feature_id;
> +
> +	if (!fw->vcp->vcp_device) {
> +		dev_err(dev, "vcp device is null\n");
> +		return;
> +	}
> +
> +	if (!fw->vcp->is_register_done)
> +		return;
> +
> +	feature_id =3D VDEC_FEATURE_ID;
> +	ret =3D vcp_device->ops->vcp_deregister_feature(vcp_device, VDEC_FEATUR=
E_ID);
> +	if (ret < 0) {
> +		dev_err(dev, "deregister feature_id(%d) fail(%d)\n", feature_id, ret);
> +		return;
> +	}
> +
> +	fw->vcp->is_register_done =3D false;
> +}
> +
> +static const struct mtk_vcodec_fw_ops mtk_vcodec_vcp_msg =3D {
> +	.load_firmware =3D mtk_vcodec_vcp_load_firmware,
> +	.get_vdec_capa =3D mtk_vcodec_vcp_get_vdec_capa,
> +	.map_dm_addr =3D mtk_vcodec_vcp_dm_addr,
> +	.ipi_register =3D mtk_vcodec_vcp_set_ipi_register,
> +	.ipi_send =3D mtk_vcodec_vcp_ipi_send,
> +	.release =3D mtk_vcodec_vcp_release,
> +};
> +
> +struct mtk_vcodec_fw *mtk_vcodec_fw_vcp_init(void *priv, enum mtk_vcodec=
_fw_use fw_use)
> +{
> +	struct mtk_vcp_msg_node *msg_node;
> +	struct platform_device *plat_dev;
> +	struct mtk_vcodec_fw *fw;
> +	int i;
> +
> +	if (fw_use =3D=3D DECODER) {
> +		struct mtk_vcodec_dec_dev *dec_dev =3D priv;
> +
> +		plat_dev =3D dec_dev->plat_dev;
> +	} else {
> +		pr_err("Invalid fw_use %d (use a reasonable fw id here)\n", fw_use);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	fw =3D devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
> +	if (!fw)
> +		return ERR_PTR(-ENOMEM);
> +
> +	fw->type =3D VCP;
> +	fw->pdev =3D plat_dev;
> +	fw->fw_use =3D fw_use;
> +	fw->ops =3D &mtk_vcodec_vcp_msg;
> +	fw->vcp =3D devm_kzalloc(&plat_dev->dev, sizeof(*fw->vcp), GFP_KERNEL);
> +	if (!fw->vcp)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&fw->vcp->msg_queue.msg_list);
> +	INIT_LIST_HEAD(&fw->vcp->msg_queue.node_list);
> +	spin_lock_init(&fw->vcp->msg_queue.lock);
> +	init_waitqueue_head(&fw->vcp->msg_queue.wq);
> +	atomic_set(&fw->vcp->msg_queue.cnt, 0);
> +	fw->vcp->pdev =3D plat_dev;
> +
> +	for (i =3D 0; i < VCP_MAX_MQ_NODE_CNT; i++) {
> +		msg_node =3D devm_kzalloc(&plat_dev->dev, sizeof(*msg_node), GFP_KERNE=
L);
> +		if (!msg_node)
> +			return ERR_PTR(-ENOMEM);
> +
> +		list_add(&msg_node->list, &fw->vcp->msg_queue.node_list);
> +	}
> +
> +	return fw;
> +}
> +EXPORT_SYMBOL_GPL(mtk_vcodec_fw_vcp_init);
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vcp.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
> new file mode 100644
> index 000000000000..1072c37078f4
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
> @@ -0,0 +1,142 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + * Author: Yunfei Dong <yunfei.dong@mediatek.com>
> + */
> +
> +#ifndef _MTK_VCODEC_FW_VCP_H_
> +#define _MTK_VCODEC_FW_VCP_H_
> +
> +typedef void (*vcp_ipi_handler_t) (void *data, unsigned int len, void *p=
riv);
> +
> +#define VCP_MAX_MQ_NODE_CNT=C2=A0 6
> +#define VCP_SHARE_BUF_SIZE 64
> +
> +#define VCODEC_VSI_LEN (0x2000)
> +
> +/* enum mtk_vcp_ipi_index - index used to separate different hardware */
> +enum mtk_vcp_ipi_index {
> +	VCP_IPI_LAT_DECODER,
> +	VCP_IPI_CORE_DECODER,
> +	VCP_IPI_MAX,
> +};
> +
> +/**
> + * struct mtk_vcp_msg_queue - process the vcp message between kernel wit=
h vcp
> + *
> + * @msg_list:=C2=A0 store share buffer list which from vcp to kernel
> + * @wq:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 waitqueue that can be =
used to wait for vcp message
> + * @lock:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 protect msg list
> + * @cnt:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the count of share obj in m=
sg list
> + * @node_list: share obj list
> + */
> +struct mtk_vcp_msg_queue {
> +	struct list_head msg_list;
> +	wait_queue_head_t wq;
> +	/* protect msg_list and node_list */
> +	spinlock_t lock;
> +	atomic_t cnt;
> +	struct list_head node_list;
> +};
> +
> +/**
> + * struct mtk_vcp_ipi_desc - store the ack handler
> + *
> + * @lock:=C2=A0=C2=A0=C2=A0 protect ack handler data
> + * @handler: calling this handler when kernel receive ack
> + * @priv:=C2=A0=C2=A0=C2=A0 private data when calling handler to process
> + */
> +struct mtk_vcp_ipi_desc {
> +	/* protect handler and priv */
> +	struct mutex lock;
> +	vcp_ipi_handler_t handler;
> +	void *priv;
> +};
> +
> +/**
> + * struct mtk_vcp_share_obj - share buffer used to send data to vcp
> + *
> + * @id:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 message index
> + * @len:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 message size
> + * @share_buf: message data
> + */
> +struct mtk_vcp_share_obj {
> +	unsigned int id;
> +	unsigned int len;
> +	unsigned char share_buf[VCP_SHARE_BUF_SIZE];
> +};
> +
> +/* enum mtk_vcp_ipi_msg_status - the status when send message to vcp */
> +enum mtk_vcp_ipi_msg_status {
> +	VCODEC_IPI_MSG_STATUS_OK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D 0,
> +	VCODEC_IPI_MSG_STATUS_FAIL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D -1,
> +	VCODEC_IPI_MSG_STATUS_MAX_INST=C2=A0=C2=A0 =3D -2,
> +	VCODEC_IPI_MSG_STATUS_ILSEQ=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D -3,
> +	VCODEC_IPI_MSG_STATUS_INVALID_ID =3D -4,
> +	VCODEC_IPI_MSG_STATUS_DMA_FAIL=C2=A0=C2=A0 =3D -5,
> +};
> +
> +/**
> + * struct mtk_vcp_msg_node - share buffer used to send data to vcp
> + *
> + * @ipi_data: share obj data
> + * @list:=C2=A0=C2=A0=C2=A0=C2=A0 list to store msg node
> + */
> +struct mtk_vcp_msg_node {
> +	struct mtk_vcp_share_obj ipi_data;
> +	struct list_head list;
> +};
> +
> +/**
> + * struct mtk_vcp - vcp firmware private data
> + *
> + * @is_init_done:=C2=A0 vcp is ready to use
> + *
> + * @ipi_mutex:=C2=A0=C2=A0=C2=A0=C2=A0 used to protect ipi data
> + * @msg_signaled:=C2=A0 whether receive ack from vcp
> + * @msg_wq:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wake message queue
> + *
> + * @ipi_desc:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 store ack handler
> + * @ipi_id_ack:=C2=A0=C2=A0=C2=A0 the ack handler status
> + *
> + * @msg_queue:=C2=A0=C2=A0=C2=A0=C2=A0 process vcp message
> + * @share_data:=C2=A0=C2=A0=C2=A0 temp share obj data
> + *
> + * @vcp_notify:=C2=A0=C2=A0=C2=A0 register notifier to vcp
> + *
> + * @vsi_addr:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vsi virtual data address
> + * @vsi_core_addr: vsi core virtual data address
> + * @iova_addr:=C2=A0=C2=A0=C2=A0=C2=A0 vsi iova address
> + * @vsi_size:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vsi size
> + *
> + * @pdev:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 platform=
 device
> + * @vcp_device:=C2=A0=C2=A0=C2=A0 vcp private data
> + * @is_register_done: register vcodec to vcp
> + */
> +struct mtk_vcp {
> +	bool is_init_done;
> +
> +	/* serialize ipi message send/receive */
> +	struct mutex ipi_mutex;
> +	bool msg_signaled[VCP_IPI_MAX];
> +	wait_queue_head_t msg_wq[VCP_IPI_MAX];
> +
> +	struct mtk_vcp_ipi_desc ipi_desc[VCP_IPI_MAX];
> +	bool ipi_id_ack[VCP_IPI_MAX];
> +
> +	struct mtk_vcp_msg_queue msg_queue;
> +	struct mtk_vcp_share_obj share_data;
> +
> +	struct notifier_block vcp_notify;
> +
> +	void *vsi_addr;
> +	void *vsi_core_addr;
> +	dma_addr_t iova_addr;
> +	int vsi_size;
> +
> +	struct platform_device *pdev;
> +	struct mtk_vcp_device *vcp_device;
> +	bool is_register_done;
> +};
> +
> +#endif
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> index 3632037f78f5..41643db9f4eb 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> @@ -130,3 +130,4 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(void *pr=
iv, enum mtk_vcodec_fw_use
> =C2=A0
> =C2=A0	return fw;
> =C2=A0}
> +EXPORT_SYMBOL_GPL(mtk_vcodec_fw_vpu_init);
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c
> index d220b645e455..ce17b649022f 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -376,12 +376,15 @@ static int mtk_vcodec_probe(struct platform_device =
*pdev)
> =C2=A0	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
> =C2=A0				=C2=A0 &rproc_phandle)) {
> =C2=A0		fw_type =3D VPU;
> +		dev->fw_init =3D mtk_vcodec_fw_vpu_init;
> =C2=A0	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp"=
,
> =C2=A0					 &rproc_phandle)) {
> =C2=A0		fw_type =3D SCP;
> +		dev->fw_init =3D mtk_vcodec_fw_scp_init;
> =C2=A0	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vcp"=
,
> =C2=A0					 &rproc_phandle)) {
> =C2=A0		fw_type =3D VCP;
> +		dev->fw_init =3D mtk_vcodec_fw_vcp_init;
> =C2=A0	} else {
> =C2=A0		dev_dbg(&pdev->dev, "Could not get vdec IPI device");
> =C2=A0		return -ENODEV;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h
> index c9d27534c63e..15e437323af5 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -251,6 +251,7 @@ struct mtk_vcodec_dec_ctx {
> =C2=A0 * @vdecsys_regmap: VDEC_SYS register space passed through syscon
> =C2=A0 *
> =C2=A0 * @fw_handler: used to communicate with the firmware.
> + * @fw_init: firmware-specific init callback selected at probe time
> =C2=A0 * @id_counter: used to identify current opened instance
> =C2=A0 *
> =C2=A0 * @dec_mutex: decoder hardware lock
> @@ -292,6 +293,7 @@ struct mtk_vcodec_dec_dev {
> =C2=A0	struct regmap *vdecsys_regmap;
> =C2=A0
> =C2=A0	struct mtk_vcodec_fw *fw_handler;
> +	struct mtk_vcodec_fw *(*fw_init)(void *priv, enum mtk_vcodec_fw_use fw_=
use);
> =C2=A0	u64 id_counter;
> =C2=A0
> =C2=A0	/* decoder hardware mutex lock */
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_en=
c_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv=
.c
> index 4e4541b2fc8e..dc54d445d98d 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> @@ -259,9 +259,11 @@ static int mtk_vcodec_probe(struct platform_device *=
pdev)
> =C2=A0	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
> =C2=A0				=C2=A0 &rproc_phandle)) {
> =C2=A0		fw_type =3D VPU;
> +		dev->fw_init =3D mtk_vcodec_fw_vpu_init;
> =C2=A0	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp"=
,
> =C2=A0					 &rproc_phandle)) {
> =C2=A0		fw_type =3D SCP;
> +		dev->fw_init =3D mtk_vcodec_fw_scp_init;
> =C2=A0	} else {
> =C2=A0		dev_err(&pdev->dev, "[MTK VCODEC] Could not get venc IPI device")=
;
> =C2=A0		return -ENODEV;
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_en=
c_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv=
.h
> index 0cddfa13594f..934ff648125d 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
> @@ -174,6 +174,7 @@ struct mtk_vcodec_enc_ctx {
> =C2=A0 * @venc_pdata: encoder IC-specific data
> =C2=A0 *
> =C2=A0 * @fw_handler: used to communicate with the firmware.
> + * @fw_init: firmware-specific init callback selected at probe time
> =C2=A0 * @id_counter: used to identify current opened instance
> =C2=A0 *
> =C2=A0 * @enc_mutex: encoder hardware lock.
> @@ -201,6 +202,7 @@ struct mtk_vcodec_enc_dev {
> =C2=A0	const struct mtk_vcodec_enc_pdata *venc_pdata;
> =C2=A0
> =C2=A0	struct mtk_vcodec_fw *fw_handler;
> +	struct mtk_vcodec_fw *(*fw_init)(void *priv, enum mtk_vcodec_fw_use fw_=
use);
> =C2=A0	u64 id_counter;
> =C2=A0
> =C2=A0	/* encoder hardware mutex lock */

--=-GogitkVNMOTwu37Eb8w7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalgqzwAKCRDZQZRRKWBy
9OKMAQCmZ1Cg4nTcVaLKTTCezIh0jhod29i3O+EYWyIqaqkFagEAhyGELes/4K35
Sng1L3Rb1M+gMmwmjq3+dxacL93a+AY=
=kiuV
-----END PGP SIGNATURE-----

--=-GogitkVNMOTwu37Eb8w7--
