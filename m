Received: from mail-24429.protonmail.ch (mail-24429.protonmail.ch [109.224.244.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6668A28E0F
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 17:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791306212; cv=none; b=quLYXzydd27eVoRlV4eWcEuN2WHuhyLuONgVnatew9S2JV3wYTwxP0vysY9xl7/v1e/D0hW2ktuUQ7608Ijp60wpqbxgkci06YwWjAGSqzmu9SmsUWAQc+/kTgAn+UNTz2CMpRJXMx2NiTkUsJREqwrDOqWHrXkfhJw12g4MuWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791306212; c=relaxed/simple;
	bh=qOMkr1StEcsgVXDJzB0nJvQsUQ/2raexfiJ0WG6gzOY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kDVZxFQDm9RJ643LJDkB8b7yi2QeOjmI64sEVgRzNX/YEVmsZoz7TkmN8j7Ak2cj7lfL9AfZI3gtjzm+5L5qnXZ62QJFH3XZB67BdIjcSSmn/NZfNaARJ3bhZZJWZ7DkmQO/aPfFTP/Q96i2WlUE9KYBwjDOxsC0WiaRq6KgAQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=GY5WCriA; arc=none smtp.client-ip=109.224.244.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="GY5WCriA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791306201; x=1791565401;
	bh=iRENHYlMt7TiUOGBz5K8wEQszDYDlzvcZG6slMbbnEo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GY5WCriApFlqRTP6EgubtxyQcPr/NAzVTQvX5XVdnYnlJsCGV01I8dYuzGej1idj3
	 U9HeUeLN9ipbo5bUzlE/3YpZU7FL1MDk1+PUxLRZia3LqZJ6ItaQmKjSNgXGkQjdmU
	 NaPZSiz7dZ+iqS94C+XLZTbYuFKSG7+G5d0+EvLWEMes5QfblRAzqT6XNb5xBabbmi
	 AXVMNo5IgMywINGQdffJtHUZVfy983XplTcsWR2pA1cVzMb4oORbFkfJ4xpenGJ8qo
	 MaSNrVDEiPPDvb9s9hnBXWh7uohiCfx9PgyseAiNCP/1FK2mgKAvmU9dOXDMJgdXH5
	 4ABc5XKgqPkVg==
Date: Tue, 06 Oct 2026 17:03:15 +0000
To: Antti Laakso <antti.laakso@linux.intel.com>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: sakari.ailus@linux.intel.com, Bingbu Cao <bingbu.cao@linux.intel.com>, bingbu.cao@intel.com, tian.shu.qiu@intel.com, linux-media@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, ilpo.jarvinen@linux.intel.com, tfiga@chromium.org, senozhatsky@chromium.org, claus.stovgaard@gmail.com, laurent.pinchart@ideasonboard.com, andriy.shevchenko@linux.intel.com, tomi.valkeinen@ideasonboard.com, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: RFC: Intel IPU4 driver proof of concept
Message-ID: <aedlbUANNY6QvZ_mrVqU9aH15j76MKgYxxwkpmayED7tFEDztNQN8A-vDuLUIRpb9At6QpBp4gg9RAOA6gvD-LpCOUpFm8aVDJ5IK87tpPg=@proton.me>
In-Reply-To: <aeXaMGExmtpNcUFS@alaakso-DESK>
References: <20230727071558.1148653-11-bingbu.cao@intel.com> <900a1efcbf29aa238f2ace788dc739e9c6ad3c26.camel@gmail.com> <9d5d0bd8-41d1-4879-fccf-54e56aaa5073@redhat.com> <e0cc94736e4142f2d661a8bbb0c800b709349377.camel@gmail.com> <83426573-8c4b-ec20-6916-2917aa06954f@redhat.com> <e136389011517dbc65b30f6bf0b1a9c49ab4e599.camel@gmail.com> <6f37f978-4898-473e-b774-7965d25bf27b@proton.me> <jsjMql5IQTMsAgViwR9vrMG4CZ1hVx9JMN4wbc0E98BvUP-TRpgtYalrmzQeor4UHRCbLg3bBeeZcaWrTujAMrf0G8q8NyQrd4o954ZayKA=@proton.me> <aeXaMGExmtpNcUFS@alaakso-DESK>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: 9e4864f95f8f4947d8176c35842365919f239f8c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I've got IPU4P support working on top of the upstream IPU6 driver [1][2].
This builds on Antti's work [3].

With help from supermepsipax, thisiscamk, ConsultingFuture4200,
georgemihaila and others in the linux-surface community [4], together
with the libcamera developers, both the front- and rear-facing cameras
can now capture images on the Surface Pro 7 (Ice Lake).

The IR camera also works with the downstream driver but I haven't
tested it yet, so it is not included in this patchset.

Links:
[1] https://github.com/ruslanbay/ipu4-drivers
[2] https://github.com/ruslanbay/linux/commits/ipu4p-upstream
[3] https://lore.kernel.org/all/20260907113004.2489993-1-sakari.ailus@linux=
.intel.com/
[4] https://github.com/linux-surface/linux-surface



On Monday, April 20th, 2026 at 9:48 AM, Antti Laakso <antti.laakso@linux.in=
tel.com> wrote:

> Hi Ruslan,
>=20
> Thank you for working on this.
>=20
> On Wed, Mar 04, 2026 at 11:03:51AM +0000, Ruslan Bay wrote:
> > Currently there are multiple IPU driver implementations actively
> > maintained by Intel engineers:
> >
> > - mainline IPU6 [1]
> > - downstream IPU6 [2]
> > - downstream IPU4/IPU4P [3]
> > - staging IPU7 [4]
> > - downstream IPU7 [5]
> >
> > As mentioned earlier, IPU4 and IPU6 share a large portion of the
> > code base, and IPU7 appears architecturally very similar as well.
> >
> > The IPU7 TODO mentions working toward a common IPU module [6].
> > There was also an attempt to move from ipu6_* back to more
> > generic ipu_* naming [7].
> >
> > Is a unified IPU core still planned?
>=20
> We're working on extending ipu6 driver to support ipu7 as well. The
> exact schedule is not available yet.
>=20
> >
> > If so, is it expected to include IPU4/IPU4P support?
> >
> > Links:
> > [1] https://github.com/torvalds/linux/tree/master/drivers/media/pci/int=
el/ipu6
> > [2] https://github.com/intel/ipu6-drivers
> > [3] https://github.com/intel/linux-intel-lts/tree/lts-v5.15.195-android=
_t-251103T063840Z/drivers/media/pci/intel
> > [4] https://github.com/torvalds/linux/tree/master/drivers/staging/media=
/ipu7
> > [5] https://github.com/intel/ipu7-drivers
> > [6] https://github.com/torvalds/linux/blob/master/drivers/staging/media=
/ipu7/TODO#L17
> > [7] https://lore.kernel.org/all/20250502154446.88965-6-stanislaw.gruszk=
a@linux.intel.com/
> >
> >
> >
> > On Sunday, February 22nd, 2026 at 8:57 PM, Ruslan Bay <ruslanbey@proton=
.me> wrote:
> >
> > > We now have a working IPU4P driver for Ice Lake devices [1][2].
> > >
> > > The current IPU4P implementation is based on Intel=E2=80=99s downstre=
am IPU4
> > > driver [3]. ISYS capture works with libcamera and has been tested on
> > > Surface Pro 7 and Surface Book 3 [4]. The world-facing camera (ov8865=
)
> > > works; the user-facing (ov5693) is still being debugged.
> > >
> > > IPU4P and IPU6 both contain PSYS implementations downstream, but in
> > > practice only ISYS is usable with libcamera today.
> > >
> > > Earlier in this thread Andreas noted that IPU4 and IPU6 share more th=
an
> > > 85% of the code base.IPU7 appears architecturally very similar as wel=
l.
> > >
> > > Before preparing an RFC, I would like clarification on direction:
> > >
> > > 1. Is the long-term plan to unify IPU6 and IPU7 under a common driver
> > >    structure?
> > > 2. If so, should IPU4/IPU4P be aligned on top of that?
> > > 3. If not, would it make sense to follow Andreas=E2=80=99 approach [5=
],
> > >    implement IPU4P on top of the IPU6 structure, and move it to
> > >    staging while iterating, as has been done for IPU7?
> > >
> > > The primary goal is upstream IPU4P support (large Ice Lake user base)=
,
> > > but ideally this should align with the Apollo Lake IPU4 work shared
> > > earlier [5].
> > >
> > > What direction would you recommend?
> > >
> > > [1] https://github.com/ruslanbay/ipu4-drivers/tree/main/patches/kerne=
l/v6.19
> > > [2] https://github.com/ruslanbay/linux/commits/ipu4-6.19
> > > [3] https://github.com/intel/linux-intel-lts/tree/lts-v5.15.195-andro=
id_t-251103T063840Z/drivers/media/pci/intel
> > > [4] https://github.com/linux-surface/linux-surface/discussions/1353?s=
ort=3Dnew
> > > [5] https://github.com/Kleist/ipu4-driver
> > >
> > > Thanks,
> > > Ruslan Bay
> > >
> > > On 12/20/23 1:53 PM, Andreas Helbech Kleist wrote:
> > > > Hi,
> > > >
> > > > As mentioned previously in Bingbu's IPU6 patch series, I'm working =
on
> > > > porting the driver to IPU4. I've now got a hole through so I think =
it
> > > > makes sense sense to share the code.
> > > >
> > > > I'm able to capture frames with yavta with the current code, but th=
ere
> > > > are several issues that needs to be fixed for it to be complete.
> > > >
> > > > # How it is tested
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > The hardware is a custom x86 PC-like embedded device with the follo=
wing
> > > > video pipeline:
> > > > Endoscope -> FPGA -> tc358748 -> IPU4 (E3950/Apollo Lake)
> > > >
> > > > See my colleague Claus' description[2] for more info.
> > > >
> > > > There is currently no V4L2 subdevice for the FPGA, so we have a cus=
tom
> > > > ambu-tc358748.c driver which pretends to be an image sensor.
> > > >
> > > > $ media-ctl -v \
> > > >   -V "\
> > > >     \"tc358748 0-000e\"    :0 [fmt:RGB888_1X24/800x800],\
> > > >     \"Intel IPU4 CSI2 0\"  :0 [fmt:RGB888_1X24/800x800],\
> > > >     \"Intel IPU4 CSI2 0\"  :1 [fmt:RGB888_1X24/800x800]\
> > > >     "\
> > > >   -l "\
> > > >     \"tc358748 0-000e\"    :0 -> \"Intel IPU4 CSI2 0\" :0 [1],\
> > > >     \"Intel IPU4 CSI2 0\"  :1 -> \"Intel IPU4 ISYS Capture 12\" :0 =
[5]\
> > > >   "
> > > >
> > > > $ yavta --data-prefix -c2 -n2 -I -s 800x800 --file=3D/tmp/frame-#.b=
in \
> > > >         -f XBGR32 /dev/video12
> > > >
> > > > This produces frame-*.bin files containing 800x800x4 bytes of valid
> > > > "BGR0" data.
> > > >
> > > > # The code
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > The code is available at the tag
> > > > https://github.com/Kleist/linux/tree/kleist-v6.6-ipu4-hacks-1
> > > > (15245fe26e07)
> > > >
> > > >
> > > > Note that I haven't renamed the files to ipu4, to make it clear wha=
t
> > > > the changes are compared to the IPU6 driver.
> > > >
> > > > It is based on v6.6 with the IPU6 v2 patches[1] on top, and then my
> > > > hacks to make the IPU4 work. This is not meant for upstreaming as i=
t
> > > > is. The commits are a cleaned up version of the chronological order=
 I
> > > > made the port in. It is not yet in a state where I think an RFC PAT=
CH
> > > > series makes sense yet, but I wanted to share it anyway.
> > > >
> > > > ## Changes compared to IPU6
> > > > diff --stat of the changes in ../ipu6/ compared to the IPU6 v2 patc=
hes:
> > > >
> > > >  drivers/media/pci/intel/ipu6/Kconfig               |  12 +-
> > > >  drivers/media/pci/intel/ipu6/Makefile              |  13 +-
> > > >  drivers/media/pci/intel/ipu6/ipu6-bus.c            |   2 +-
> > > >  drivers/media/pci/intel/ipu6/ipu6-bus.h            |   6 +-
> > > >  drivers/media/pci/intel/ipu6/ipu6-buttress.c       |  71 ++-
> > > >  drivers/media/pci/intel/ipu6/ipu6-buttress.h       |   8 +-
> > > >  drivers/media/pci/intel/ipu6/ipu6-fw-com.c         |  45 +-
> > > >  drivers/media/pci/intel/ipu6/ipu6-fw-com.h         |   2 +-
> > > >  drivers/media/pci/intel/ipu6/ipu6-fw-isys.c        | 171 ++++---
> > > >  drivers/media/pci/intel/ipu6/ipu6-fw-isys.h        | 237 ++++++---=
-
> > > >  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      | 219 +++++----
> > > >  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h      |  11 +-
> > > >  drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |  33 +-
> > > >  drivers/media/pci/intel/ipu6/ipu6-isys-queue.h     |   8 +-
> > > >  drivers/media/pci/intel/ipu6/ipu6-isys-video.c     | 212 +++------
> > > >  drivers/media/pci/intel/ipu6/ipu6-isys-video.h     |   4 -
> > > >  drivers/media/pci/intel/ipu6/ipu6-isys.c           | 435 +++------=
----
> > > > -----
> > > >  drivers/media/pci/intel/ipu6/ipu6-isys.h           |  18 +-
> > > >  drivers/media/pci/intel/ipu6/ipu6-mmu.c            | 130 +++++-
> > > >  .../pci/intel/ipu6/ipu6-platform-buttress-regs.h   |  98 +---
> > > >  .../pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h   | 226 ++-------
> > > >  drivers/media/pci/intel/ipu6/ipu6-platform-regs.h  | 172 ++-----
> > > >  drivers/media/pci/intel/ipu6/ipu6.c                | 511 ++++++++-=
----
> > > > --------
> > > >  drivers/media/pci/intel/ipu6/ipu6.h                |  37 +-
> > > >  24 files changed, 1032 insertions(+), 1649 deletions(-)
> > > >
> > > > Note that most of the deleted lines are removed because they are no=
t
> > > > used in IPU4. E.g. the watermark handling, which I haven't seen an
> > > > equivalent for in the old IPU4 driver.
> > > >
> > > > ## Ambu-specific tweaks
> > > > Note that I'm using a hacked ipu-bridge (AMBU_IPU_BRIDGE) to setup =
the
> > > > fwnode graph for our hardware. You don't want if you're testing thi=
s,
> > > > so revert at least the "ambu: Add AMBU_IPU_BRIDGE" commit.
> > > >
> > > > I'm not sure the right approach for handling this would be going
> > > > forward. Of course the ambu-ipu-bridge shouldn't be upstreamed, so =
I'm
> > > > wondering how we can achieve something similar? The ACPI tables fro=
m
> > > > our BIOS unfortunately don't contain any info about the Toshiba Bri=
dge
> > > > (tc358748), so we can't derive the information from there. Maybe so=
me
> > > > kind of platform driver could be created which tweaks the ACPI info
> > > > before the ipu-bridge driver reads it?
> > > >
> > > > What do you typically do when you have some proprietary hardware th=
at
> > > > does not provide proper ACPI information? We could carry the ambu-i=
pu-
> > > > bridge patches in our internal kernel tree, but that is not desirab=
le
> > > > in the long term.
> > > >
> > > > # Inspiration for the IPU4 port
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > We are currently using a Intel LTS 4.19.217 based kernel[3], which
> > > > contains the old IPU4 driver. The port was basically made by compar=
ing
> > > > mmiotrace's between the old IPU4 driver and the new driver.
> > > >
> > > > We're using the IPU4 FW ipu4_cpd_b0.bin extracted from a ClearLinux
> > > > package[4].
> > > >
> > > > # Known issues
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > ## Doesn't yet work with gstreamer for unknown reasons
> > > > I get "Unexpected buffer address:" errors from
> > > > ipu6_isys_queue_buf_ready, and don't get an image through.
> > > >
> > > > ## 64 byte chunks of wrong data
> > > > We occasionally get 64 byte aligned 64 byte wrong data (all 0xCC) i=
n
> > > > the captured frame*.bin files. This could be a cache invalidation
> > > > issue, we haven't looked into this yet. The code currently doesn't =
use
> > > > zlw_invalidate, even though it was ported from the old driver. We
> > > > haven't yet tested if enabling this fixes the issue.
> > > >
> > > > # Upstreaming
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > We would like to upstream this driver, probably after the IPU6 driv=
er
> > > > has been merged. We're definitely not ready yet (either), but I alr=
eady
> > > > have a couple of questions, that it would be nice to get some input=
 on
> > > > from the community.
> > > >
> > > > ## How to share code between IPU4 and IPU6
> > > > Big parts of the code (approximately 6k out of 7k lines) does not n=
eed
> > > > to be changed compared to the IPU6 driver, so there is clearly a bi=
g
> > > > overlap in what the two drivers need to do. I'm not sure how the be=
st
> > > > approach would be for sharing this functionality. I see a few optio=
ns:
> > > > 1. Shared driver that supports both IPU's (still split in PCI drive=
r
> > > > and -isys driver)
> > > > 2. Shared PCI driver that supports both IPU's, but device-specific
> > > > intel-ipu4-isys/intel-ipu6-isys drivers
> > > > 3. Separate drivers that use a shared "library module" (for lack of=
 a
> > > > better term)
> > > >
> > > > My gut feeling is that 2. is the right choice, especially if we mov=
ed
> > > > the shared code in to the PCI driver and the more version-specific =
code
> > > > was moved into the specific drivers.
> > > >
> > > > The answer to this could also be input to Bingbu's IPU6 series, may=
be
> > > > it would make sense to place some files differently if they eventua=
lly
> > > > will be used in both IPU4 and IPU6 drivers?
> > > >
> > > > ## How to implement our platform specific fwnode graph?
> > > > As mentioned above, we currently have a hacked ambu-ipu-bridge driv=
er,
> > > > which is clearly not upstreamable. What would you typically do if y=
ou
> > > > need to make a v4l setup where the ACPI table information about
> > > > sensors/bridges is missing?
> > > >
> > > > /Andreas
> > > >
> > > > [1]https://lore.kernel.org/all/20231024112924.3934228-1-bingbu.cao@=
intel.com/
> > > > [2]
> > > > https://lore.kernel.org/all/471df7ffdf34b73d186c429a366cfee62963015=
f.camel@gmail.com/
> > > > [3]
> > > > https://github.com/intel/linux-intel-lts/tree/lts-v4.19.217-base-21=
1118T072627Z
> > > > [4]
> > > > https://download.clearlinux.org/releases/32370/clear/source/SRPMS/l=
inux-firmware-ipu-19ww39-104.src.rpm
> > >
> > >
> >
> 
