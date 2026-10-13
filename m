Received: from mail-24426.protonmail.ch (mail-24426.protonmail.ch [109.224.244.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD0C51614F
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 18:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916190; cv=none; b=g8tG35pxbMlDDe66ZqMSq3QHl2pBaaJr3mrPq2JPZW60MJB1/W2LCDYS7OyY+TJxR1rBR0Xq0+st0YIJ5UPT5+SzE3q7oRlYzXntHQgdiSfAgppyZW1lQQQeo4LbgNrNsQziU4xLvyXKhQWjwoH0LO1qbp84P4E8u5dhnlkJmgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916190; c=relaxed/simple;
	bh=Jc5kVjaIvrVzJx7ky92egVz48vIHJM/iJFD5G57W5vw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ipUdCHM0tyH3QHUu4rKkxWs0hqPyiDyh5ZpmzIsTLKZudj+p6WkEx2SGHRdvToDtq6tTs/Zwl97DWkGSRgOjxDQie7fIqSbYB1N3kJ51bDwPlf1XRIOUOOtpYOBg/OvMepZCOzcUlH8Cx7JxYGk6OsV9zq7Ot2PRJn47YIWqin8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=IpfpviZs; arc=none smtp.client-ip=109.224.244.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="IpfpviZs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791916178; x=1792175378;
	bh=rcjNWCXsrYhU+u2xKjQwjd8YiDw+SFcZ9jpsnXUZL7c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IpfpviZsfgZeqQUyVD/VgXDatamPDos1rTLIKt+9tysXdPNmVmeLWXmdGjaSSxZz3
	 x3x7OVtxzvi7V7M7lUczzxVSInOOIRYwfUP+L9whualV90jNukhis4gFWXNhw2Npou
	 nZpi7O7WVhNLDBVoUoaCBzSpOAJizrbvzIYzkm5abh92MS/O7hAKAnfX5KHv4MEmSI
	 gANbJS9X6lcodqrkvq8bvMUNs/ohY+yUmq+6mVj0jMECa66N5tojqUYRbqHesURJwD
	 QLuF+4vzaKemVk9ST43QGXT5XnTqq4JuYPqunPd5I0LoLQffI5IAep1fJiJkyY5S+Z
	 /OS91Rcf04hLA==
Date: Tue, 13 Oct 2026 18:29:34 +0000
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Antti Laakso <antti.laakso@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH 04/12] media: ipu6: Add IPU4P ISYS firmware ABI definitions
Message-ID: <5sleSQOqNDPxVOaifGIKhCVzH7Kq9c7lkDYUgNc0grt8RBVzoywijJ_KleG_HXqceJE5ztkpU2lf4Xqp_wqVpYsjmZtcBpX988d6RE4j_3w=@proton.me>
In-Reply-To: <asyzc6CsBUT-i-nJ@kekkonen.localdomain>
References: <h67Um68BP1VslpsztVmKAyUu6AoQcVo4s_A0r3mDfxX_hG-qeXrzlJHcZqfJcoK0AXLB82AzrcDCtXrFt7PkSdzfSC53YU4mboVhmLgFIZU=@proton.me> <asyzc6CsBUT-i-nJ@kekkonen.localdomain>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: 93ef8ad5358bac33870da315fbd2f6cab97b60c0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Monday, October 12th, 2026 at 12:16 PM, sakari.ailus@linux.intel.com <sa=
kari.ailus@linux.intel.com> wrote:

> Hi Ruslan,
>
> On Sun, Oct 11, 2026 at 02:35:21PM +0000, Ruslan Bay wrote:
> > Add IPU4P ISYS firmware ABI structures, enums, constants, and limits
> > used by the firmware interface. Explicitly align 64-bit fields to keep
> > the wire layout stable on 32-bit x86 builds.
> >
> > Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h | 408 +++++++++++++++++++
> >  drivers/media/pci/intel/ipu6/ipu6-isys.h     |   5 +
> >  2 files changed, 413 insertions(+)
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h
> >
> > diff --git a/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h b/drivers/med=
ia/pci/intel/ipu6/ipu4p-fw-isys.h
> > new file mode 100644
> > index 000000000000..afc288b939bd
> > --- /dev/null
> > +++ b/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h
> > @@ -0,0 +1,408 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/* Copyright (C) 2026 Intel Corporation */
> > +
> > +#ifndef IPU4P_FW_ISYS_H
> > +#define IPU4P_FW_ISYS_H
> > +
> > +#include <linux/build_bug.h>
> > +#include <linux/irqreturn.h>
> > +#include <linux/stddef.h>
> > +#include <linux/types.h>
> > +
> > +struct ipu6_bus_device;
> > +struct ipu6_fw_isys_ops;
> > +struct ipu6_isys;
> > +struct ipu6_isys_video;
> > +struct ipu6_isys_stream;
> > +struct ipu6_isys_buffer_list;
> > +struct isys_fw_msgs;
>
> At least some of these aren't referenced below; you should add these in t=
he
> patch that needs them.
>

Will do, thanks!

> > +
> > +#define IPU4P_ISYS_MAX_STREAMS=09=09=098U
> > +#define IPU4P_MAX_IPINS=09=09=09=094U
> > +#define IPU4P_MAX_OPINS=09=09=09=096U
> > +#define IPU4P_NOF_SRAM_BLOCKS_MAX=09=098U
> > +#define IPU4P_DEV_SEND_QUEUE_SIZE=09=098U
> > +#define IPU4P_ISYS_SIZE_RECV_QUEUE=09=0940U
> > +#define IPU4P_ISYS_SIZE_SEND_QUEUE=09=0940U
> > +#define IPU4P_ISYS_SIZE_PROXY_RECV_QUEUE=095U
> > +#define IPU4P_ISYS_SIZE_PROXY_SEND_QUEUE=095U
> > +#define IPU4P_ISYS_OPEN_RETRY=09=09=092000
> > +#define IPU4P_ISYS_CLOSE_RETRY=09=09=092000
> > +
> > +#define IPU4P_BASE_PROXY_SEND_QUEUES=09=090U
> > +#define IPU4P_BASE_DEV_SEND_QUEUES=09=091U
> > +#define IPU4P_BASE_MSG_SEND_QUEUES=09=092U
> > +#define IPU4P_BASE_PROXY_RECV_QUEUES=09=090U
> > +#define IPU4P_BASE_MSG_RECV_QUEUES=09=091U
> > +#define IPU4P_N_MAX_RECV_QUEUES=09=09=092U
> > +
> > +#define IPU4P_ISYS_CROPPING_LOCATION_MAX=094U
> > +#define IPU4P_ISYS_RESOLUTION_INFO_MAX=09=092U
> > +#define IPU4P_ISYS_QUEUE_TYPE_MAX=09=093U
> > +
> > +enum ipu4p_fw_isys_resp_type {
> > +=09IPU4P_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE =3D 0,
> > +=09IPU4P_FW_ISYS_RESP_TYPE_STREAM_START_ACK,
> > +=09IPU4P_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK,
> > +=09IPU4P_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_ACK,
> > +=09IPU4P_FW_ISYS_RESP_TYPE_STREAM_STOP_ACK,
> > +=09IPU4P_FW_ISYS_RESP_TYPE_STREAM_FLUSH_ACK,
> > +=09IPU4P_FW_ISYS_RESP_TYPE_STREAM_CLOSE_ACK,
> > +=09IPU4P_FW_ISYS_RESP_TYPE_PIN_DATA_READY,
> > +=09IPU4P_FW_ISYS_RESP_TYPE_PIN_DATA_WATERMARK,
> > +=09IPU4P_FW_ISYS_RESP_TYPE_FRAME_SOF,
> > +=09IPU4P_FW_ISYS_RESP_TYPE_FRAME_EOF,
> > +=09IPU4P_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE,
> > +=09IPU4P_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_DONE,
> > +=09IPU4P_FW_ISYS_RESP_TYPE_PIN_DATA_SKIPPED,
> > +=09IPU4P_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_SKIPPED,
> > +=09IPU4P_FW_ISYS_RESP_TYPE_FRAME_SOF_DISCARDED,
> > +=09IPU4P_FW_ISYS_RESP_TYPE_FRAME_EOF_DISCARDED,
> > +=09IPU4P_FW_ISYS_RESP_TYPE_STATS_DATA_READY,
> > +=09N_IPU4P_FW_ISYS_RESP_TYPE
> > +};
> > +
> > +enum ipu4p_fw_isys_send_type {
> > +=09IPU4P_FW_ISYS_SEND_TYPE_STREAM_OPEN =3D 0,
> > +=09IPU4P_FW_ISYS_SEND_TYPE_STREAM_START,
> > +=09IPU4P_FW_ISYS_SEND_TYPE_STREAM_START_AND_CAPTURE,
> > +=09IPU4P_FW_ISYS_SEND_TYPE_STREAM_CAPTURE,
> > +=09IPU4P_FW_ISYS_SEND_TYPE_STREAM_STOP,
> > +=09IPU4P_FW_ISYS_SEND_TYPE_STREAM_FLUSH,
> > +=09IPU4P_FW_ISYS_SEND_TYPE_STREAM_CLOSE,
> > +=09N_IPU4P_FW_ISYS_SEND_TYPE
> > +};
> > +
> > +enum ipu4p_fw_isys_queue_type {
> > +=09IPU4P_FW_ISYS_QUEUE_TYPE_PROXY =3D 0,
> > +=09IPU4P_FW_ISYS_QUEUE_TYPE_DEV,
> > +=09IPU4P_FW_ISYS_QUEUE_TYPE_MSG,
> > +=09N_IPU4P_FW_ISYS_QUEUE_TYPE
> > +};
> > +
> > +enum ipu4p_fw_isys_stream_source {
> > +=09IPU4P_FW_ISYS_STREAM_SRC_PORT_0 =3D 0,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_PORT_1,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_PORT_2,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_PORT_3,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_PORT_4,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_PORT_5,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_PORT_6,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_PORT_7,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_PORT_8,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_PORT_9,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_PORT_10,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_PORT_11,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_PORT_12,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_PORT_13,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_PORT_14,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_PORT_15,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_0,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_1,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_2,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_3,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_4,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_5,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_6,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_7,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_8,
> > +=09IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_9,
> > +=09N_IPU4P_FW_ISYS_STREAM_SRC
> > +};
> > +
> > +enum ipu4p_fw_isys_mipi_vc {
> > +=09IPU4P_FW_ISYS_MIPI_VC_0 =3D 0,
> > +=09IPU4P_FW_ISYS_MIPI_VC_1,
> > +=09IPU4P_FW_ISYS_MIPI_VC_2,
> > +=09IPU4P_FW_ISYS_MIPI_VC_3,
> > +=09N_IPU4P_FW_ISYS_MIPI_VC
> > +};
> > +
> > +enum ipu4p_fw_isys_frame_format_type {
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_NV11 =3D 0,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_NV12,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_NV12_16,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_NV12_TILEY,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_NV16,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_NV21,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_NV61,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_YV12,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_YV16,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_YUV420,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_YUV420_10,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_YUV420_12,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_YUV420_14,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_YUV420_16,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_YUV422,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_YUV422_16,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_UYVY,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_YUYV,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_YUV444,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_YUV_LINE,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_RAW8,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_RAW10,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_RAW12,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_RAW14,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_RAW16,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_RGB565,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_PLANAR_RGB888,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_RGBA888,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_QPLANE6,
> > +=09IPU4P_FW_ISYS_FRAME_FORMAT_BINARY_8,
> > +=09N_IPU4P_FW_ISYS_FRAME_FORMAT
> > +};
> > +
> > +enum ipu4p_fw_isys_mipi_data_type {
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_FRAME_START_CODE =3D 0x00,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_FRAME_END_CODE =3D 0x01,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_LINE_START_CODE =3D 0x02,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_LINE_END_CODE =3D 0x03,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_EMBEDDED =3D 0x12,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_YUV420_8 =3D 0x18,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_YUV420_10 =3D 0x19,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_YUV422_8 =3D 0x1e,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_YUV422_10 =3D 0x1f,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_RGB_565 =3D 0x22,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_RGB_888 =3D 0x24,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_RAW_6 =3D 0x28,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_RAW_7 =3D 0x29,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_RAW_8 =3D 0x2a,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_RAW_10 =3D 0x2b,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_RAW_12 =3D 0x2c,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_RAW_14 =3D 0x2d,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_RAW_16 =3D 0x2e,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF1 =3D 0x30,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF2 =3D 0x31,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF3 =3D 0x32,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF4 =3D 0x33,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF5 =3D 0x34,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF6 =3D 0x35,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF7 =3D 0x36,
> > +=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF8 =3D 0x37,
> > +=09N_IPU4P_FW_ISYS_MIPI_DATA_TYPE =3D 0x40
> > +};
> > +
> > +enum ipu4p_fw_isys_pin_type {
> > +=09IPU4P_FW_ISYS_PIN_TYPE_MIPI =3D 0,
> > +=09IPU4P_FW_ISYS_PIN_TYPE_RAW_NS,
> > +=09IPU4P_FW_ISYS_PIN_TYPE_RAW_S,
> > +=09IPU4P_FW_ISYS_PIN_TYPE_RAW_SOC,
> > +=09IPU4P_FW_ISYS_PIN_TYPE_METADATA_0,
> > +=09IPU4P_FW_ISYS_PIN_TYPE_METADATA_1,
> > +=09IPU4P_FW_ISYS_PIN_TYPE_AWB_STATS,
> > +=09IPU4P_FW_ISYS_PIN_TYPE_AF_STATS,
> > +=09IPU4P_FW_ISYS_PIN_TYPE_HIST_STATS,
> > +=09IPU4P_FW_ISYS_PIN_TYPE_PAF_FF,
> > +=09N_IPU4P_FW_ISYS_PIN_TYPE
> > +};
> > +
> > +enum ipu4p_fw_isys_isl_use {
> > +=09IPU4P_FW_ISYS_USE_NO_ISL_NO_ISA =3D 0,
> > +};
> > +
> > +enum ipu4p_fw_isys_mipi_store_mode {
> > +=09IPU4P_FW_ISYS_MIPI_STORE_MODE_NORMAL =3D 0,
> > +=09IPU4P_FW_ISYS_MIPI_STORE_MODE_DISCARD_LONG_HEADER,
> > +=09N_IPU4P_FW_ISYS_MIPI_STORE_MODE
> > +};
> > +
> > +enum ipu4p_fw_isys_link_id {
> > +=09IPU4P_FW_ISYS_LINK_OFFLINE =3D 0,
> > +=09IPU4P_FW_ISYS_LINK_MAIN_OUTPUT =3D 1,
> > +=09IPU4P_FW_ISYS_LINK_PDAF_OUTPUT =3D 2,
> > +=09N_IPU4P_FW_ISYS_LINK_ID
> > +};
> > +
> > +enum ipu4p_fw_isys_error {
> > +=09IPU4P_FW_ISYS_ERROR_NONE =3D 0,
> > +=09IPU4P_FW_ISYS_ERROR_FW_INTERNAL_CONSISTENCY,
> > +=09IPU4P_FW_ISYS_ERROR_HW_CONSISTENCY,
> > +=09IPU4P_FW_ISYS_ERROR_DRIVER_INVALID_COMMAND_SEQUENCE,
> > +=09IPU4P_FW_ISYS_ERROR_DRIVER_INVALID_DEVICE_CONFIGURATION,
> > +=09IPU4P_FW_ISYS_ERROR_DRIVER_INVALID_STREAM_CONFIGURATION,
> > +=09IPU4P_FW_ISYS_ERROR_DRIVER_INVALID_FRAME_CONFIGURATION,
> > +=09IPU4P_FW_ISYS_ERROR_INSUFFICIENT_RESOURCES,
> > +=09IPU4P_FW_ISYS_ERROR_HW_REPORTED_STR2MMIO,
> > +=09IPU4P_FW_ISYS_ERROR_HW_REPORTED_SIG2CIO,
> > +=09IPU4P_FW_ISYS_ERROR_SENSOR_FW_SYNC,
> > +=09IPU4P_FW_ISYS_ERROR_STREAM_IN_SUSPENSION,
> > +=09IPU4P_FW_ISYS_ERROR_RESPONSE_QUEUE_FULL,
> > +=09N_IPU4P_FW_ISYS_ERROR
> > +};
> > +
> > +enum ipu4p_fw_proxy_error {
> > +=09IPU4P_FW_PROXY_ERROR_NONE =3D 0,
> > +=09IPU4P_FW_PROXY_ERROR_INVALID_WRITE_REGION,
> > +=09IPU4P_FW_PROXY_ERROR_INVALID_WRITE_OFFSET,
> > +=09N_IPU4P_FW_PROXY_ERROR
> > +};
> > +
> > +struct ipu4p_fw_isys_resolution {
> > +=09u32 width;
> > +=09u32 height;
> > +};
> > +
> > +struct ipu4p_fw_isys_isa_cfg {
> > +=09struct ipu4p_fw_isys_resolution
> > +=09=09isa_res[IPU4P_ISYS_RESOLUTION_INFO_MAX];
> > +=09u32 cfg_fields;
> > +};
> > +
> > +struct ipu4p_fw_isys_cropping {
> > +=09s32 top_offset;
> > +=09s32 left_offset;
> > +=09s32 bottom_offset;
> > +=09s32 right_offset;
> > +};
> > +
> > +struct ipu4p_fw_isys_input_pin_info {
> > +=09struct ipu4p_fw_isys_resolution input_res;
> > +=09u8 dt;
> > +=09u8 mipi_store_mode;
> > +=09u8 bits_per_pix;
> > +=09u8 mapped_dt;
> > +};
> > +
> > +/**
> > + * struct ipu4p_fw_isys_output_pin_info - IPU4P output pin configurati=
on
> > + *
> > + * Unlike the IPU6 ABI, IPU4P ends this structure at reserve_compressi=
on;
> > + * snoopable and sensor_type are not part of the IPU4P firmware wire f=
ormat.
> > + *
> > + * @link_id: PPG link; zero selects offline capture
> > + */
> > +struct ipu4p_fw_isys_output_pin_info {
> > +=09struct ipu4p_fw_isys_resolution output_res;
> > +=09u32 stride;
> > +=09u32 watermark_in_lines;
> > +=09u32 payload_buf_size;
> > +=09u8 send_irq;
> > +=09u8 input_pin_id;
> > +=09u8 pt;
> > +=09u8 ft;
> > +=09u8 link_id;
> > +=09u8 reserve_compression;
> > +};
> > +
> > +struct ipu4p_fw_isys_stream_cfg {
> > +=09/* Preserve the firmware ABI slot; ISA is disabled by this driver. =
*/
> > +=09struct ipu4p_fw_isys_isa_cfg isa_cfg;
> > +=09struct ipu4p_fw_isys_cropping crop[IPU4P_ISYS_CROPPING_LOCATION_MAX=
];
> > +=09struct ipu4p_fw_isys_input_pin_info input_pins[IPU4P_MAX_IPINS];
> > +=09struct ipu4p_fw_isys_output_pin_info output_pins[IPU4P_MAX_OPINS];
> > +=09u32 compfmt;
> > +=09u8 nof_input_pins;
> > +=09u8 nof_output_pins;
> > +=09u8 send_irq_sof_discarded;
> > +=09u8 send_irq_eof_discarded;
> > +=09u8 send_resp_sof_discarded;
> > +=09u8 send_resp_eof_discarded;
> > +=09u8 src;
> > +=09u8 vc;
> > +=09u8 isl_use;
> > +};
> > +
> > +struct ipu4p_fw_isys_output_pin_payload {
> > +=09__aligned_u64 out_buf_id;
> > +=09u32 addr;
> > +=09u32 compress;
> > +};
> > +
> > +struct ipu4p_fw_isys_param_pin {
> > +=09__aligned_u64 param_buf_id;
> > +=09u32 addr;
> > +};
> > +
> > +struct ipu4p_fw_isys_frame_buff_set {
> > +=09struct ipu4p_fw_isys_output_pin_payload
> > +=09=09output_pins[IPU4P_MAX_OPINS];
> > +=09struct ipu4p_fw_isys_param_pin process_group_light;
> > +=09u8 send_irq_sof;
> > +=09u8 send_irq_eof;
> > +=09u8 send_irq_capture_ack;
> > +=09u8 send_irq_capture_done;
> > +=09u8 send_resp_sof;
> > +=09u8 send_resp_eof;
> > +=09u8 frame_counter;
> > +};
> > +
> > +struct ipu4p_fw_isys_error_info {
> > +=09u32 error;
> > +=09u32 error_details;
> > +};
> > +
> > +struct ipu4p_fw_isys_resp_info {
> > +=09__aligned_u64 buf_id;
> > +=09struct ipu4p_fw_isys_output_pin_payload pin;
> > +=09struct ipu4p_fw_isys_param_pin process_group_light;
> > +=09struct ipu4p_fw_isys_error_info error_info;
> > +=09u32 timestamp[2];
> > +=09u8 stream_handle;
> > +=09u8 type;
> > +=09u8 pin_id;
> > +=09u8 acc_id;
> > +=09u8 frame_counter;
> > +=09u8 written_direct;
> > +};
> > +
> > +struct ipu4p_fw_isys_proxy_error_info {
> > +=09u32 error;
> > +=09u32 error_details;
> > +};
> > +
> > +struct ipu4p_fw_isys_proxy_resp_info {
> > +=09u32 request_id;
> > +=09struct ipu4p_fw_isys_proxy_error_info error_info;
> > +};
> > +
> > +struct ipu4p_fw_isys_send_token {
> > +=09__aligned_u64 buf_handle;
>
> Is this useful? Shouldn't this be rather taken into account when allocati=
ng
> memory? This probably is already effectively the case though.
>

Thanks, I=E2=80=99ll take a closer look at this.

> > +=09u32 payload;
> > +=09u16 send_type;
> > +=09u16 stream_id;
> > +};
> > +
> > +struct ipu4p_fw_isys_recv_token {
> > +=09struct ipu4p_fw_isys_resp_info resp_info;
> > +};
> > +
> > +struct ipu4p_fw_isys_proxy_send_token {
> > +=09u32 request_id;
> > +=09u32 region_index;
> > +=09u32 offset;
> > +=09u32 value;
> > +};
> > +
> > +struct ipu4p_fw_isys_proxy_recv_token {
> > +=09struct ipu4p_fw_isys_proxy_resp_info proxy_resp_info;
> > +};
> > +
> > +struct ipu4p_fw_isys_buffer_partition {
> > +=09u32 num_gda_pages[IPU4P_ISYS_MAX_STREAMS];
> > +};
> > +
> > +struct ipu4p_fw_isys_fw_config {
> > +=09struct ipu4p_fw_isys_buffer_partition buffer_partition;
> > +=09u32 num_send_queues[IPU4P_ISYS_QUEUE_TYPE_MAX];
> > +=09u32 num_recv_queues[IPU4P_ISYS_QUEUE_TYPE_MAX];
> > +};
> > +
> > +/*
> > + * These structures are copied directly to and from the IPU4P firmware=
 queues.
> > + * Keep the 64-bit fields 8-byte aligned; the firmware ABI depends on =
the
> > + * exact sizes and offsets below.
> > + */
> > +static_assert(sizeof(struct ipu4p_fw_isys_output_pin_info) =3D=3D 28);
> > +static_assert(offsetof(struct ipu4p_fw_isys_output_pin_info, link_id) =
=3D=3D 24);
> > +static_assert(offsetof(struct ipu4p_fw_isys_output_pin_info,
> > +=09=09       reserve_compression) =3D=3D 25);
> > +static_assert(sizeof(struct ipu4p_fw_isys_stream_cfg) =3D=3D 316);
> > +static_assert(offsetof(struct ipu4p_fw_isys_stream_cfg, output_pins) =
=3D=3D 132);
> > +static_assert(offsetof(struct ipu4p_fw_isys_stream_cfg, compfmt) =3D=
=3D 300);
> > +static_assert(offsetof(struct ipu4p_fw_isys_stream_cfg, src) =3D=3D 31=
0);
> > +static_assert(sizeof(struct ipu4p_fw_isys_frame_buff_set) =3D=3D 120);
> > +static_assert(sizeof(struct ipu4p_fw_isys_resp_info) =3D=3D 64);
> > +
> > +extern const struct ipu6_fw_isys_ops ipu4p_fw_isys_ops;
> > +
> > +#endif /* IPU4P_FW_ISYS_H */
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/p=
ci/intel/ipu6/ipu6-isys.h
> > index 8674c041b994..3a91f6a34c5a 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
> > @@ -19,6 +19,7 @@
> >  #include "ipu6.h"
> >  #include "ipu6-fw-isys.h"
> >  #include "ipu7-fw-isys.h"
> > +#include "ipu4p-fw-isys.h"
> >  #include "ipu6-isys-csi2.h"
> >  #include "ipu6-isys-video.h"
> >
> > @@ -179,6 +180,10 @@ struct isys_fw_msgs {
> >  =09=09=09struct ipu7_fw_isys_frame_buff_set frame;
> >  =09=09=09struct ipu7_fw_isys_stream_cfg stream;
> >  =09=09} ipu7;
> > +=09=09union {
> > +=09=09=09struct ipu4p_fw_isys_frame_buff_set frame;
> > +=09=09=09struct ipu4p_fw_isys_stream_cfg stream;
> > +=09=09} ipu4p;
> >  =09};
> >  =09struct list_head head;
> >  =09dma_addr_t dma_addr;
>
> --
> Regards,
>
> Sakari Ailus
>
