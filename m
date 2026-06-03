Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241A844B690;
	Wed,  3 Jun 2026 11:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780484947; cv=none; b=ryF63Qx3BZT0pfguT6TG/EwlYzDpHayY/ujUz92GynoFJKA/g8K/pB/6yeaLFxJIT4qcJ1nJBmx/beuwo4qgIxx+0Z1f1TbDk6T7IELE+6NQTMkCcGWNVj8KRABn+48SeoNH8TNguakNBi6+GuvcfuZGg5igboiSr5654Yhz3d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780484947; c=relaxed/simple;
	bh=ftvyRYpjB8pmum990nt0hD6Bkg4iBVaLWkdOHWYhp7U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XLcLPkjB9Fi0/iAUhIhE5bRmxLNSuPJhqdauqqUgWB1wPmRcrmdtqN/weydZQ1lGDJNKFFz6LUIk/6+5kaVcoWP7WKjdYDjGMfbtDc1xcbLHeMOM6VbO9XPHp0hFi2+PKAF4H/IOQfZCm3TfDIzBvlOG9ToiSaHAVSLZutTv4rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=npE87eNG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="npE87eNG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95F51F00898;
	Wed,  3 Jun 2026 11:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780484946;
	bh=I1sOp6ei3cqXa+Ch7w1tvEjmu/Vw+u2/cm+0L3vGR18=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=npE87eNGhY4KCdv0n7XD4M/lWlPngb7Ws9dAQYSR0u6vo/PBai7J7agKJKDpsP6bj
	 /uW7j/ygf/vueLnJ6S0YJRxVTVkpZVaDactR6BTGyxqkxQXq1J9HrLdZ8Hxj2Ky/GS
	 UepXqGxmEt1LNYKnPSuwilllEyIbfUsvmyjoiwUus5eQANPJZTLzogssiHSB+SuSy9
	 OLbKfQnGc+7vFpkxipLn5uLjVQC7YqbDcEzTWjziKD03F5UJLkzxpcVDbOquUQlDwc
	 mXxLrk4RTU8/RsjPJ1FYM/MzaBIWfqcz7j3CtSh0dJRuCLHe5DZsDL3ElKM4x8TuWi
	 nAxC2aPbFbaZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/14] media: mediatek: vcodec: send share memory
 address to vcp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260603084045.17488-11-kyrie.wu@mediatek.com>
References: <20260603084045.17488-11-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 11:09:05 +0000
Message-Id: <20260603110905.B95F51F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The size of `struct vdec_ap_ipi_init` is increased from 16 to 24 b=
ytes, and this larger size is unconditionally sent to all firmware architec=
tures, risking backward compatibility breakage and firmware buffer overflow=
s for older VPU/SCP implementations.
--

commit d463b7b0f56f0354049dbd8919b4208b451e2182
Author: Yunfei Dong <yunfei.dong@mediatek.com>

media: mediatek: vcodec: send share memory address to vcp

The share memory is allocated in kernel for vcp architecture, it's
different with vpu which share memors is reserved in vpu micro
processor. Need to send share memory address to vcp.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.=
h b/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
> @@ -67,11 +67,13 @@ struct vdec_vpu_ipi_ack {
>   * @msg_id	: AP_IPIMSG_DEC_INIT
>   * @codec_type	: codec fourcc
>   * @ap_inst_addr	: AP video decoder instance address
> + * @shared_iova	: reserved share memory address
>   */
>  struct vdec_ap_ipi_init {
>  	uint32_t msg_id;
>  	u32 codec_type;
>  	uint64_t ap_inst_addr;
> +	u64 shared_iova;
>  };

[ ... ]

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c=
 b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> @@ -236,6 +236,8 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
>  	msg.msg_id =3D AP_IPIMSG_DEC_INIT;
>  	msg.ap_inst_addr =3D (unsigned long)vpu;
>  	msg.codec_type =3D vpu->codec_type;
> +	if (mtk_vcodec_fw_get_type(vpu->ctx->dev->fw_handler) =3D=3D VCP)
> +		msg.shared_iova =3D vpu->ctx->dev->fw_handler->vcp->iova_addr;
> =20
>  	mtk_vdec_debug(vpu->ctx, "vdec_inst=3D%p", vpu);

[Severity: High]
Could this structure size increase break compatibility with legacy VPU and =
SCP
firmwares?

Adding shared_iova to struct vdec_ap_ipi_init increases the message size
from 16 to 24 bytes. A few lines later in vpu_dec_init(), the message is
sent unconditionally using the new larger size:

    err =3D vcodec_vpu_send_msg(vpu, (void *)&msg, sizeof(msg));

If legacy firmware implementations expect exactly 16 bytes for
AP_IPIMSG_DEC_INIT, could sending a 24-byte payload cause initialization
failures or stack buffer overflows in the legacy firmware?

Perhaps the driver should only send the expanded length when communicating
with the VCP architecture, or use offsetof() to send the original 16-byte
size to older targets.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603084045.1748=
8-1-kyrie.wu@mediatek.com?part=3D10
