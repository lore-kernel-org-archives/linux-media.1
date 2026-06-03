Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B586A438FF3;
	Wed,  3 Jun 2026 08:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780476891; cv=none; b=NLne5M8NJvdk3brjze8iAWOH0RD16EBH7Q2Nr9gI82mrPMdItxik6luHOwjk3GbSwlSTwmK8NKeJTX80o9ZrujB7q+QLjqdvzd5hmnFKNIihS0cgUbsXA9UCD8ytQWvTWcHvpgYAoP2ZmY5vJdEP2jm8bt+TuxOP2UXitGzuHdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780476891; c=relaxed/simple;
	bh=nXTzEiG1fDjyLXc8w2qbFA1uKFr0hsoIOG2+9Flktmw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PXDCZWwEbdciz1nZ7Kiyyu9m1gTQApSYAfC9XRDPNwkP0X6jm/7RCW1wjXKwAo8q1Vy0CZGjw4TiH9ZkwwFhwj9WENOGO9vSdPSkO0iYDG842TPMTBQ7iX+SDisF548MhFNVz1Ztewr1WrPRGolacSj7CtBuLi+vZMILbQK0lls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PGVhWorm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PGVhWorm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 549C91F00898;
	Wed,  3 Jun 2026 08:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780476888;
	bh=xfBAnRAcYM96OFV3BVo0K7VfsBeZ3rozjtb2hki/yeQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PGVhWormap2hwdZesxF5rwWBsUbs6biEz7l0TvH44rGca+VT1Y441kJ5ZaCTVOBKS
	 5wh8X03xSplKzjexs/yZJAO0heO1i6rP9iuCjUjZG6MJSNL45DpJtbIqpWH1SQmCRG
	 JHGpuHV5mkdlwD77vjj5yhhVr6bgOi639IaUZiIh9evl0dy7iKqhBegZZSIuBhsY5Q
	 7mFls1rwFG6sCrs/Daovsxyy39X0gzuUT8lJ8rRzGzCa9BlVTzp6IFauLN0nMmRRrk
	 8oxe3FMTNHKlOoSJJ7F44+EtKSIo7IJnxKwaaN4Wc44A0e9REyGmXGwGGdX35eMI82
	 tqe1M92AO/vHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/14] media: mediatek: vcodec: add debug information
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: linux-media@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260603084045.17488-10-kyrie.wu@mediatek.com>
References: <20260603084045.17488-10-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 08:54:47 +0000
Message-Id: <20260603085448.549C91F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] Incorrect debug output string for V4L2_PIX_FMT_MT2110R (Typo)

Pre-existing issues:
- [Critical] Use-After-Free and List Corruption in debugfs due to Lock Mism=
atch
- [High] Out-of-Bounds Read in debugfs due to missing null terminator
--

commit 87b57cf0a11ac27db38b48d00f4d66f14eff0f96
Author: Yunfei Dong <yunfei.dong@mediatek.com>

media: mediatek: vcodec: add debug information
   =20
Print hevc/av1 output format and 10bit capture format
information to debug.

> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbg=
fs.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> index 2da11521fc7b9..b3c69c46240cf 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c

[ ... ]

> @@ -45,6 +53,14 @@ static void mtk_vdec_dbgfs_get_format_type(struct mtk_=
vcodec_dec_ctx *ctx, char
>  		curr_len =3D snprintf(buf + *used, total - *used,
>  				    "\tcapture format: MT21C\n");
>  		break;
> +	case V4L2_PIX_FMT_MT2110T:
> +		curr_len =3D snprintf(buf + *used, total - *used,
> +				    "\tcapture format: MT2110T (10bit tile mode)\n");
> +		break;
> +	case V4L2_PIX_FMT_MT2110R:
> +		curr_len =3D snprintf(buf + *used, total - *used,
> +				    "\tcapture format: MT2110T (10bit raster mode)\n");

[Severity: Low]
Does this incorrectly print MT2110T instead of MT2110R for the raster mode
format?

> +		break;
>  	default:
>  		curr_len =3D snprintf(buf + *used, total - *used,
>  				    "\tunsupported capture format: 0x%x\n",
> @@ -122,9 +138,10 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp=
, char __user *ubuf,

[Severity: High]
This is a pre-existing issue, but does mtk_vdec_dbgfs_read() safely handle
dbgfs->dbgfs_buf?

Earlier in this function, the code checks:

if (strstr(dbgfs->dbgfs_buf, "-help") || dbgfs->buf_size =3D=3D 1) {

However, mtk_vdec_dbgfs_write() uses simple_write_to_buffer() to copy user
payload into dbgfs->dbgfs_buf without ensuring the string is null-terminate=
d.
Can this cause strstr() to read out-of-bounds?

[Severity: Critical]
This is a pre-existing issue, but is the list traversal in
mtk_vdec_dbgfs_read() fully protected against concurrent modification?

The traversal iterates over &dbgfs->dbgfs_head while holding
dbgfs->dbgfs_lock:

mtk_vcodec_dbgfs.c:mtk_vdec_dbgfs_read() {
    ...
    mutex_lock(&dbgfs->dbgfs_lock);
    list_for_each_entry(dbgfs_inst, &dbgfs->dbgfs_head, node) {
    ...
}

However, mtk_vcodec_dbgfs_remove() mutates this same list and frees the
nodes without acquiring dbgfs->dbgfs_lock:

mtk_vcodec_dbgfs.c:mtk_vcodec_dbgfs_remove() {
    ...
    list_for_each_entry(dbgfs_inst, &vcodec_dev->dbgfs.dbgfs_head, node) {
        if (dbgfs_inst->inst_id =3D=3D ctx_id) {
            ...
            list_del(&dbgfs_inst->node);
            kfree(dbgfs_inst);
    ...
}

Can this lead to a use-after-free or list corruption if
mtk_vcodec_dbgfs_remove() races with the mtk_vdec_dbgfs_read() traversal?

> =20
>  		if (dbgfs_index[MTK_VDEC_DBGFS_PICINFO]) {
>  			curr_len =3D snprintf(buf + used_len, total_len - used_len,
> -					    "\treal(%dx%d)=3D>align(%dx%d)\n",
> +					    "\treal(%dx%d)=3D>align(%dx%d) 10bit(%d)\n",
>  					    ctx->picinfo.pic_w, ctx->picinfo.pic_h,
> -					    ctx->picinfo.buf_w, ctx->picinfo.buf_h);
> +					    ctx->picinfo.buf_w, ctx->picinfo.buf_h,
> +					    ctx->is_10bit_bitstream);
>  			used_len +=3D curr_len;
>  		}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603084045.1748=
8-1-kyrie.wu@mediatek.com?part=3D9
