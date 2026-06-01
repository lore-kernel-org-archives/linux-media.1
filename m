Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269762EA72A;
	Mon,  1 Jun 2026 16:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780332245; cv=none; b=gWRMmR8NGq5I5atrRpeM5xt94Oo4wuhV1ia8Ib7YmkEfSKEZuzpqjboV1E5cvgCwr16U53I+pIylfxHBicHeqAfa+qIXSanU5fuOjtAl6j0tDAtuGj9HoYA49H6RxtkLPFFB6wp2tCsNE5Z007T//FGMl9xYCxo6z0KMew7x/TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780332245; c=relaxed/simple;
	bh=0V6wKVE5UM9luDzIOm7uAI+Rhb1JbIKjWFdughNxhko=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iIFdK9cC60q5USMQHAOBmpPTB68ayft2wSQTW/P59Ig/mgfhfCevSvWJHwi7aEHnLg2exDkKaOc+sOFiA/bOxK1EAWNB3c3+9sp52bwCIwyhq0C0nE5zRFsic0k+c0q5Ty0nNVx/X1rr+0SGId6H2BbqCbEofr332Qb2Hb9qbLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUV0elJt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUV0elJt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE831F00893;
	Mon,  1 Jun 2026 16:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780332243;
	bh=mbYgnj8yBGdyA6uHH8MliJ0lbjB8x4igY0Zs1aSm5ow=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OUV0elJtIcThM3eH/93mvkd0E8WLb9pzpjD98ZQAJ5UJNkwGy48FVHpgIPNtu/ccH
	 IyaFRFMRMoktFw/zU9hjZXbUVGdOw1M+xtq8KcECJWyUQicTsefVlmV14BUmu1E7fA
	 N7LG3lUVEnXXKhccZ/wjL6EA28KAgQvPj3bRRZIhuZrvyutGrBYaf5ZJndaOMs82Fc
	 8S4af0UfQGz7B+umOHmNxWDmCu1IEQa2lqrpJuR2LvYb1OF/AuxyVPWRoExSqullls
	 CtTyv+MpC/P0PHdvkqR6fzjq4XGYhQKFVxz+Sb5llrf5SBQrdRfbFuerEt9nujMRO4
	 vCqpKp3l2DQ+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 5/5] media: qcom: camss: vfe: Add support for VFE
 gen4
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: conor+dt@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260601-kaanapali-camss-v14-5-e76f26aa6691@oss.qualcomm.com>
References: <20260601-kaanapali-camss-v14-5-e76f26aa6691@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 16:44:03 +0000
Message-Id: <20260601164403.8CE831F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Unconditional issue of `CAMSS_INIT_BUF_COUNT` AUP_UPDATEs in CSID =
stream configuration violates the Kaanapali hardware constraint, mismatchin=
g the actual number of enqueued VFE buffers.

Pre-existing issues:
- [High] Cross-linked VFE and CSID pipelines will write `reg_update` comman=
ds to the wrong CSID instance.
- [High] Concurrent read-modify-write of `csid->aup_update` and `csid->rup_=
update` across process and interrupt contexts without synchronization.
--

commit 961118b5c346fbca24b27d8e33cf75e4120aa72e
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: vfe: Add support for VFE gen4

Add Video Front End (VFE) version gen4 as found on the Kaanapali SoC.
The FULL front end modules in Kaanapali camera subsystem are called TFEs
(Thin Front End), however, retaining the name VFE at places to maintain
consistency and avoid unnecessary code changes.

> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c b/drivers=
/media/platform/qcom/camss/camss-vfe-gen4.c
> new file mode 100644
> index 0000000000000..d73d70898710a
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
[ ... ]
> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line=
_id)
> +{
> +	int port_id =3D line_id;
> +
> +	camss_reg_update(vfe->camss, vfe->id, port_id, false);
> +}

[Severity: High]
This isn't a bug introduced by this patch, but cross-linked VFE and CSID
pipelines will write reg_update commands to the wrong CSID instance.

When this callback executes to commit buffer addresses during runtime, it
passes vfe->id as the hw_id to camss_reg_update(). In camss_reg_update(), t=
his
hw_id is used to index into the CSID array:

    csid =3D &camss->csid[hw_id];
    csid->res->hw_ops->reg_update(csid, port_id, is_clear);

If the media graph cross-links a CSID source pad to a mismatched VFE sink p=
ad
(e.g., CSID 0 to VFE 1), the register update is erroneously dispatched to
CSID 1. Could this starve the active CSID of necessary buffer updates and
trigger an unclocked register access (and panic) if CSID 1 is powered off?

[Severity: High]
This is a pre-existing issue, but there appears to be a data race when upda=
ting
the CSID register bitmasks across process and interrupt contexts.

When userspace queues a buffer during an active stream, vfe_queue_buffer_v2=
()
runs in process context and delegates to __csid_aup_update() via this
reg_update callback. In __csid_aup_update(), a read-modify-write operation
is performed:

    csid->aup_update |=3D CSID_RUP_AUP_RDI(port_id);

Concurrently, a hardware interrupt can fire on another CPU, executing
csid_isr() in hardirq context. This delegates to __csid_aup_rup_clear() whi=
ch
modifies the exact same bitmask:

    csid->aup_update &=3D ~CSID_RUP_AUP_RDI(port_id);

Because neither context acquires a shared lock to protect csid->aup_update,
can this data race silently corrupt the bitmask and cause hardware commands=
 to
be dropped or repeatedly dispatched?

> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 319d191589884..826ab85a44a14 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
[ ... ]
> @@ -552,7 +554,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
>  		output->gen2.active_num++;
>  		ops->vfe_wm_update(vfe, output->wm_idx[0],
>  				   output->buf[i]->addr[0], line);
> -		ops->reg_update(vfe, line->id);
> +
> +		if (!vfe->res->reg_update_after_csid_config)
> +			ops->reg_update(vfe, line->id);
>  	}

[Severity: High]
The commit message documents a Kaanapali hardware constraint: "the number of
AUP_UPDATEs should match the number of buffers enqueued to the write master
while it's being enabled."

Here in vfe_enable_output_v2(), active_num is accurately populated based on
available buffers, but since reg_update_after_csid_config is true, the regi=
ster
update is deferred to the CSID.

However, csid_configure_stream() unconditionally loops CAMSS_INIT_BUF_COUNT
times:

for (k =3D 0; k < CAMSS_INIT_BUF_COUNT; k++)
    __csid_aup_update(csid, i);

If userspace queues fewer than CAMSS_INIT_BUF_COUNT buffers (since
min_queued_buffers defaults to 0), this unconditional loop will violate the
hardware constraint. Does this mismatch instruct the hardware to ingest more
frames than there are configured buffer addresses, potentially causing the
hardware to process uninitialized memory or trigger IOMMU faults?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-kaanapali-=
camss-v14-0-e76f26aa6691@oss.qualcomm.com?part=3D5
