Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08375199947
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 09:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057563; cv=none; b=qhY68i7J+kdNz0N4pwi8HngZ+BoRbWl2lMdhucCGgfL30irXfoMT81XpPDo4wfQzVKBG2QhbD88gbbxZlqDrtFRY1y9ECwOVU0M/jlik6pfop8Ve8dVrhQd+e0BWhYCAtYaEIsHnQfE781rTs5dHHoep8ZnuzQ4TbKoCAp7gW/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057563; c=relaxed/simple;
	bh=I5UrZT/l5DCNHMUUfxt/GAiWNgMa8WzFz44L5PCmXJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBtmIrukuPaATSgvxpwWSvXBSWcP1lmCWj6kM5f1k4tr8AeqnkZUVySArJ/Z1B10bRVerI79SPj/o9SmhQOZFHh6y+1vqr4zYMcV9H5StPnS+lgfYyK1ivfj5ORBA4KbIca9qEdl9EB9dlhylOG9l8Kr2FC8lYDrvAJI0ebkV/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N9JJ+FE0; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N9JJ+FE0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792057561; x=1823593561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I5UrZT/l5DCNHMUUfxt/GAiWNgMa8WzFz44L5PCmXJw=;
  b=N9JJ+FE0dVONBLgSSm3ZsbYb1rCACHoxwG8uwEmqjz2oogmO9CC6g9k4
   sRIEmzmdS5i+Kfe79t05f/jjWjbQL+yiiZ0DwSDnPx3KmzVTdk+YuiKFO
   wT9tUuS/ZUxaNSuZKArRWgeHXtoRZYTsbDo06dxqRhZD+Bv3HDsZ2jLzD
   01PZKS7L3uYytEOSdidZMzpqT6cYcYAypTmkfrlUg5NQWxu40yKIiKVFP
   TDO5o/hS84S3p/NTPT682qLxMo2s1hAJ2lUnEF7T+ZuzJgZsy4e14IgrG
   osIBZTdo46W3bU7u7r0RAUD4rY95Y/Lh/6FUaIwwXPrnWMt/vIiREkKDf
   A==;
X-CSE-ConnectionGUID: lm7TItjuTBGi0xVU1ysrQg==
X-CSE-MsgGUID: Eebz9X5AQqmwXvQ2ImSZtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="718444"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="718444"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 02:45:59 -0700
X-CSE-ConnectionGUID: nMNi43GQTm200f6h4i1jJw==
X-CSE-MsgGUID: ChKtWWk8SgW78xp1obscdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1623064"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.119])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 02:45:54 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1DE78121BE6;
	Thu, 15 Oct 2026 12:45:57 +0300 (EEST)
Date: Thu, 15 Oct 2026 12:45:57 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 15/64] media: uapi: Add generic CSI-2 raw pixelformats
Message-ID: <atCg1VOU3lWQPZGv@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-16-sakari.ailus@linux.intel.com>
 <41ad339a-c78c-4c16-922a-b23b6b79bdde@nxp.com>
 <aWY61FKxtnD6x7qI@kekkonen.localdomain>
 <f99d2cad-5351-4b8c-8019-c9703d215918@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f99d2cad-5351-4b8c-8019-c9703d215918@nxp.com>

Hi Mirela,

On Tue, Feb 17, 2026 at 08:24:37PM +0200, Mirela Rabulea wrote:
> Hi Sakari,
> 
> On 1/13/26 14:30, Sakari Ailus wrote:
> > Hi Mirela,
> > 
> > On Sat, Jul 12, 2025 at 08:08:15PM +0300, Mirela Rabulea wrote:
> > > Hi Sakari,
> > > 
> > > On 6/19/25 14:57, Sakari Ailus wrote:
> > > > Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
> > > > 
> > > > 
> > > > Add generic raw pixelformats for bit depths 8, 10, 12, 14, 16, 20, 24 and
> > > > 28. These formats are CSI-2 packed, apart from the 8-, 16- and 24-bit
> > > > formats.
> > > > 
> > > > Signed-off-by: Sakari Ailus<sakari.ailus@linux.intel.com>
> > > > ---
> > > >    .../media/v4l/pixfmt-raw-generic.rst          | 398 ++++++++++++++++++
> > > >    .../userspace-api/media/v4l/pixfmt.rst        |   1 +
> > > >    include/uapi/linux/videodev2.h                |  10 +
> > > >    3 files changed, 409 insertions(+)
> > > >    create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
> > > > 
> > > > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
> > > > new file mode 100644
> > > > index 000000000000..8561233f5262
> > > > --- /dev/null
> > > > +++ b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
> > > > @@ -0,0 +1,398 @@
> > > > +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> > > > +
> > > > +************************************************************************************************************************************************************************************************************************************************************************************
> > > > +V4L2_PIX_FMT_RAW_8 ('RAW8'), V4L2_PIX_FMT_RAW_CSI2_10 ('RACA'), V4L2_PIX_FMT_RAW_CSI2_12 ('RACC'), V4L2_PIX_FMT_RAW_CSI2_14 ('RACE'), V4L2_PIX_FMT_RAW_16 ('RAWG'), V4L2_PIX_FMT_RAW_CSI2_20 ('RACK'), V4L2_PIX_FMT_RAW_24 ('RAWO'), V4L2_PIX_FMT_RAW_CSI2_28 ('RACS')
> > > > +************************************************************************************************************************************************************************************************************************************************************************************
> > > > +
> > > > +
> > > > +Generic line-based image data formats
> > > Looking at the generated documentation, this does not appear very nice:
> > > 
> > > https://www.retiisi.eu/~sailus/v4l2/tmp/common-raw/userspace-api/media/v4l/pixfmt.html
> > > 
> > > Instead of 2.7 V4L2_PIX_FMT_RAW_8 ('RAW8'), V4L2_PIX_FMT_RAW_CSI2_10
> > > ('RACA'), ....
> > > 
> > > Would be nice to have "Generic line-based image data formats" instead, I
> > > think that should be the title.
> > Interesting idea. There will probably be (much?) less use for the non-raw
> > formats though. I wonder what others think. It'd mean re-naming these
> > macros effectively.
> > 
> > > > +
> > > > +
> > > > +Description
> > > > +===========
> > > > +
> > > > +These generic raw image data formats define the memory layout of the data
> > > > +without defining the order of the pixels in the format or even the CFA (Colour
> > > > +Filter Array) itself. These formats may only be used with a Media Controller
> > > > +pipeline where the more specific format is reported by an :ref:`internal sink
> > > > +pad <MEDIA-PAD-FL-INTERNAL>` of the source sub-device. See also :ref:`source
> > > > +routes <subdev-routing>`.
> > > > +
> > > > +.. _v4l2-pix-fmt-raw-8:
> > > > +
> > > > +V4L2_PIX_FMT_RAW_8
> > > > +------------------
> > > > +
> > > > +The V4L2_PIX_FMT_GENERIC_8 format is a plain 8-bit raw pixel data format. This
> > > > +format is used on CSI-2 for 8 bits per :term:`Data Unit`.
> > > > +
> > > > +**Byte Order Of V4L2_PIX_FMT_RAW_8.**
> > > > +Each cell is one byte. "P" denotes a pixel. + +.. tabularcolumns::
> > > > |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}| + +.. flat-table:: Sample
> > > > 4x2 Image Frame + :header-rows: 0 + :stub-columns: 0 + :widths: 12 8 8 8
> > > > 8 + + * - start + 0: + - P\ :sub:`00` + - P\ :sub:`10` + - P\ :sub:`20`
> > > > + - P\ :sub:`30` + * - start + 4: + - P\ :sub:`01` + - P\ :sub:`11` + -
> > > > P\ :sub:`21` + - P\ :sub:`31` + +.. _v4l2-pix-fmt-raw-csi2-10: +
> > > > +V4L2_PIX_FMT_RAW_CSI2_10 +------------------------ +
> > > > +V4L2_PIX_FMT_RAW_CSI2_10 contains 10-bit packed image data, with four
> > > > bytes +containing the top 8 bits of the pixels followed by lowest 2 bits
> > > > of the pixels +packed into one byte. This format is typically used by
> > > > CSI-2 receivers with +a source that transmits MEDIA_BUS_FMT_RAW_10 and
> > > > the CSI-2 receiver writes the +received data to memory as-is. + +The
> > > > packing of the data follows the MIPI CSI-2 specification. + +This format
> > > > is little endian. + +**Byte Order Of V4L2_PIX_FMT_RAW_CSI2_10.** +Each
> > > > cell is one byte. "P" denotes a pixel.
> > > > +
> > > > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|
> > > > +
> > > > +.. flat-table:: Sample 4x2 Image Frame
> > > > +    :header-rows:  0
> > > > +    :stub-columns: 0
> > > > +    :widths: 12 8 8 8 8 8
> > > > +
> > > > +    * - start + 0:
> > > > +      - P\ :sub:`00 bits 9--2`
> > > These elements of the table do not show up nice, perhaps adjusting the
> > > widths would improve the readability?
> > Hmm. They seem fine here. Which browser are you using?
> > 
> > That being said, there are issues with wider tables below. I'll try to
> > improve this for v12.
> 
> I'm using firefox, looking at https://www.retiisi.eu/~sailus/v4l2/tmp/common-raw/userspace-api/media/v4l/pixfmt-raw-generic.html
> 
> I'll send you a picture with what I see.

Yes, it looks like that here, too. I'm not sure how much can be done to
this unless we want to keep a table representation. I wonder if the line
breaks can be forced or avoided in certain locations.

-- 
Regards,

Sakari Ailus
