Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7B43FCB33;
	Wed, 19 Aug 2026 08:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787126709; cv=none; b=DADgPJSdL7D4QUC/oZEPcpAEn8UD75LM+RFOyuhi5tIbxYSgIOHfCUUdwI0YndJioiz9cinVohd//B4DIzT929uSlIrHd/As38nDgtoTn0evzOs44sZQihISs+0su5COZNIMDtTokkdXnQMx+A/y+IficDQrU+k1b3+MI1322W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787126709; c=relaxed/simple;
	bh=lixw/WzfFZgowdgqkmBRMofgqXYY5GBqOLFwjb9Itwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VkqWrQjbg32TKvOjI8UOLPVQXCFzFYDSx2cVlDvDJaCoLzuvCAdP0Hhp6uewD00wB17l/GC2bHTFaplIagbgbMy5p2YcoZSN/nigaV9+hPglLfX+wV7DdumC+gkxa6aOvARzi/br75nDeBJ9XfOumIy4mR8bJJhaN9JhH+ZMGZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KvGJVrGX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KvGJVrGX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1646E1F000E9;
	Wed, 19 Aug 2026 08:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787126706;
	bh=5cJW/36kY6uArsZ9qUTshPmFj/g5giWHY/+H1PUCFgY=;
	h=Date:From:To:Cc:Subject;
	b=KvGJVrGXpUZpC9dRdAxmUTXV5ZTEC/X77RsefFdDqXlsPUxfhhZWbPTw+0olqAHzn
	 H+LYOhUsHo382JBEqPYoIJPWokyaba1AvOKhOgNzUSoRYEmwI7hLcmRtwSoJbYU3rd
	 oitYMMaxi+HeAWeCMoCIZC2RxXIBi0KryIe9z09zNP0sLUVjCKDWH8C4sXa9wNSNaU
	 fV343G1FCRNlIddijDwA7D449uvhh5RzWeerPyF/b2wvkMTRg4IlJ1xNG3n1Ki/g9W
	 2PwMdgcmgHwB4kwJGjuHhBTsnlB1MSUEmzfWQp5KCZ80IyZPH3YFR8xlZ+DWpq44V7
	 HhEhshuKbfmAg==
Date: Wed, 19 Aug 2026 10:05:01 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v7.3] media updates
Message-ID: <20260819100501.776fe795@foz.lan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git medi=
a/v7.3-1

For:

- v4l2-core: added ISP statistics support and per-block validation;
- v4l2-core: Allow unknown HDR10 white point and luminance;
- New camera sensors: Sony IMX678 and IMX471m, Himax HM1092 IR sensor
- New codec: Milos: VPU v2.0 codec support
- isp driver: gained support for Dreamchip RPPX1 ISP framework
- vsp1 driver: gained support for RZ/T2H and RZ/N2H
- Novalake driver: gained CVS support for new NVL hardware
- dvb-core: fix feed leak on failed DMX_ADD_PID;
- several driver fixes, cleanups and minor improvements.

---

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git med=
ia/v7.3-1

for you to fetch changes up to 4900cad020c0580dfb1be27776ff10a4ef110cfa:

  media: ipu-bridge: check all DMI entries when overriding sensor rotation =
(2026-08-11 09:07:21 +0300)

----------------------------------------------------------------
Alain Volmat (1):
      media: stm32: dcmi: fix error handling on MDMA pool alloc failure

Alexander Koskovich (2):
      dt-bindings: media: qcom,milos-iris: Add Milos video codec
      media: iris: Add support for Milos (VPU v2.0)

Andr=C3=A9 Moreira (1):
      staging: media: av7110: refactor av7110_start_feed to reduce indentat=
ion

Andy Shevchenko (8):
      media: cec: core: consolidate error path in cec_allocate_adapter()
      media: cec: core: add missing mutex_destroy to error path and remove
      media: cec: core: Use DEFINE_SHOW_STORE_ATTRIBUTE() helper for debugfs
      media: cec: core: Don't use "proxy" headers
      media: cec: core: Add pr_fmt()
      media: cec: core: Consistently use CEC_NAME where it matters
      media: cec: core: Use predefined time multiplier
      media: cec: seco: Use predefined time multiplier

Antoine Bouyer (2):
      media: uapi: v4l2-isp: Add extensible statistics
      media: Documentation: uapi: Update V4L2 ISP for extensible stats

Arash Golgol (1):
      media: vimc: fix pixel format lookup in enum_framesizes

Arnd Bergmann (2):
      media: v4l2-tpg: reduce stack usage for kasan builds
      media: replace linux/gpio.h inclusions

Arun T (4):
      ACPI: scan: Honor ACPI _DEP dependency for NVL CVS
      media: pci: ipu-bridge: Add NVL CVS ACPI ID
      media: i2c: cvs: Add IPU8 PCI device ID
      media: i2c: cvs: Add NVL ACPI ID

Ashwin Gundarapu (1):
      media: cx231xx: fix null pointer deref in snd_cx231xx_pcm_close

Ben Hoff (1):
      media: hws: Remove stale control ioctl prototypes

Benjamin Mugnier (6):
      media: i2c: vd55g1: Fix media bus code initialization
      media: i2c: vd55g1: Remove spurious pad format update on init_state()
      media: i2c: vd55g1: Fix manual digital gain on color variant
      media: dt-bindings: vd55g1: Add vd55g4 compatible
      media: i2c: vd55g1: Add support for vd55g4
      media: i2c: vd55g1: Fix wrong output FPS value

Bhargav Joshi (1):
      dt-bindings: media: ti,am437x-vpfe: Convert to DT schema

Binglin Zhao (1):
      media: v4l2-ioctl: fix video_ioctl2 kernel-doc

Biren Pandya (12):
      media: cec: disable delayed work before freeing an interrupted transm=
it
      media: i2c: ov02a10: fix endpoint parsing use-after-free
      media: i2c: ov7740: fix unbalanced pm_runtime_get_sync in remove
      media: i2c: ov7740: fix use-after-destroy in remove
      media: i2c: rdacm21: Fix missing media_entity_cleanup()
      media: v4l2-fwnode: Fix fwnode leak in v4l2_fwnode_parse_link
      media: platform: hantro_drv: Add missing media_entity_cleanup()
      media: i2c: cx25840-core: Add missing media_entity_cleanup()
      media: i2c: max9286: Add missing media_entity_cleanup()
      media: i2c: msp3400-driver: Add missing media_entity_cleanup()
      media: i2c: mt9v011: Add missing media_entity_cleanup()
      media: i2c: saa7115: Add missing media_entity_cleanup()

Bryam Vargas (1):
      media: cx231xx: reject geometry changes while the VBI queue is busy

Bryan O'Donoghue (1):
      media: iris: Enumerate cap->bus_info to differentiate between encoder=
 and decoder

Chen Changcheng (2):
      media: go7007: fix memory leaks on probe error paths
      media: cx88: fix memory leak in cx8802_register_driver() error path

Christian Hewitt (1):
      media: meson: vdec: fix NULL pointer deref in vdec_try_fmt_common

Cong Nguyen (3):
      media: staging/ipu7: fix async notifier leak on init error
      media: staging/ipu7: fix async notifier UAF on probe error path
      media: intel/ipu6: fix async notifier cleanup leak on parse error

Dan Carpenter (1):
      media: stm32: dcmi: fix some error handling bugs in probe()

Dave Hansen (1):
      MAINTAINERS: Camera sensor and Intel IPU driver changes

Dave Stevenson (20):
      media: imx355: Avoid calling imx355_power_off twice in error path
      dt-bindings: media: imx355: Allow 2 CSI2 data lane output
      media: imx355: Remove duplicated registers from the mode tables
      media: imx355: Remove setting FRM_LENGTH_LINES in the mode regs
      media: imx355: Programmatically set the crop parameters for each mode
      media: imx355: Set register LINE_LENGTH_PCK programmatically
      media: imx355: Set binning mode registers programmatically
      media: imx355: Remove link_freq_index from each mode as ununsed
      media: imx355: pixel_rate never changes, so don't recompute
      media: imx355: Remove redundant fll_min, and implement fixed offset
      media: imx355: Add support for get_selection
      media: imx355: Use pm_runtime autosuspend_delay
      media: imx355: Convert to new CCI register access helpers
      media: imx355: Set the colorspace in the format
      media: imx355: Define the exposure offset, and use that define
      media: imx355: Use NULL ctrl_ops for HBLANK as it is a read-only cont=
rol
      media: imx355: Compute link frequency from PLL setup
      media: imx355: Support 2 lane readout
      media: imx355: Switch to using the subdev state
      media: imx355: Remove storing cur_mode in the state

David Carlier (6):
      media: mali-c55: fix dropped last AEC histogram zone weight
      media: mali-c55: Fix AEXP IHIST disable bit shift
      media: mali-c55: Fix scaler factor overflow for large crop sizes
      media: mali-c55: Drop redundant mutex_destroy in capture register err=
or path
      media: mali-c55: Fix clock leak on reset deassert failure
      media: i2c: imx471: Fix uninitialized error value in imx471_set_ctrl()

David Heidelberg (1):
      media: imx355: Add support for 24 MHz external clock

Dawei Feng (1):
      media: cedrus: fix memory leak in cedrus_init_ctrls()

Diego Fernando Mancera Gomez (1):
      media: em28xx: defer audio-only extension registration

Dikshita Agarwal (8):
      media: qcom: iris: fix state-change debug log printing stale value
      media: qcom: iris: Centralize internal buffer table selection
      media: qcom: iris: Fix bitmask test in iris_allow_cmd()
      media: qcom: iris: Remove dead assignment in iris_hfi_gen2_set_tier()
      media: qcom: iris: Remove duplicate HFI_PROP_OPB_ENABLE entry
      media: qcom: iris: Add missing break in iris_hfi_gen2_session_set_cod=
ec()
      media: qcom: iris: Make iris_destroy_internal_buffer() return void
      media: iris: Add Gen2 firmware autodetect and fallback

Elgin Perumbilly (3):
      media: i2c: imx412: Convert to CCI register access helpers
      media: i2c: imx412: Switch to using the sub-device state lock
      media: i2c: imx412: switch to {enable,disable}_streams

Eugen Hristev (2):
      media: bcm2835-unicam: Fix asc leaked in error/remove path
      media: bcm2835-unicam: Fix pipeline wrong validation for unpacked for=
mats

Faisal Mukhtar (1):
      media: tegra-video: Fix length warnings in tegra20.c

Fan Wu (2):
      media: ti: vpe: quiesce overflow recovery before freeing streams
      media: cx23885: cancel NetUP CI work before teardown

Frank Li (1):
      MAINTAINERS: media: nxp: imx8-isi: Add Frank Li as reviewer and i.MX =
mailing list

Gourav Kumar (1):
      media: iris: disable time-delta-based rate control for VBR

Guangshuo Li (3):
      media: platform: mtk-mdp3: Fix SCP device refcounting
      media: usbtv: Fix V4L2 refcount leak on probe failure
      media: saa7164: fix cleanup on resource allocation failure

Gui-Dong Han (1):
      media: cec-pin: Fix event FIFO ordering

Guoniu Zhou (8):
      media: dt-bindings: nxp,imx8-isi: Drop fsl,blk-ctrl requirement for i=
.MX8ULP
      media: nxp: imx8-isi: Add virtual channel support
      media: nxp: imx8-isi: Fix stream ID validation bypass in crossbar rou=
ting
      media: nxp: imx8-isi: Add stream ID validation for crossbar routing
      media: nxp: imx8-isi: Correct color map between V4L2 and ISI
      media: nxp: imx8-isi: Use BIT_ULL() for 64-bit stream masks
      media: nxp: imx8-isi: Implement per-stream reference counting for mul=
tiplexed streams
      media: nxp: imx8-isi: Add additional 32-bit RGB format support

Guoniu.zhou (1):
      media: nxp: imx8-isi: crossbar: Add get_frame_desc operation

Hans Verkuil (21):
      media: cec: extron-da-hd-4k-plus: add sanity check
      media: v4l2-async: Unregister sub-device if asc_list is empty
      media: em28xx: use v4l2_device release callback
      media: em28xx: drop 'users' field
      media: em28xx: use vb2_video_unregister_device
      media: em28xx: dev_info->pr_info since dev has been freed
      media: em28xx: requeue buffers if start_streaming fails
      Documentation: media: vidioc-g-ext-ctrls: clarify try/set behavior
      media: vivid: always allow meta output streaming
      media: cec: tegra_cec: don't break off msg on NACK
      media: cec: tegra_cec: keep track of number of Rx Low Drives
      media: cec/core: max_retries -> max_attempts
      media: cec/core: drop ABORTED/TIMEOUT check
      media: cec/core: handle core events like normal events
      media: cec/core: drop cec_post_state_event call
      media: cec/core: flush stale STATE_CHANGE events
      media: cec/core: add a new CEC_LOG_ADDRS_FL_CONFIG_FAILED flag
      media: cec/core: cec-pin: toggle rx_toggle when arb lost
      media: cec/core: add error-inj-tx-timeouts debugfs entry
      Revert "media: v4l2-dev: fix error handling in __video_register_devic=
e()"
      media: v4l2-core: v4l2-dev: add comments on device_register fail.

Hao-Qun Huang (2):
      staging: media: tegra-video: fix of_node_put() on VIP parse errors
      staging: media: tegra-video: vi: fix probe failure on skipped last po=
rt

Haoxiang Li (2):
      media: mediatek: vcodec: remove redundant return value of vdec_vp9_sl=
ice_setup_lat_buffer()
      media: mediatek: vcodec: remove redundant return value of vdec_vp9_sl=
ice_setup_prob_buffer()

Hiroki Nakajima (1):
      media: rkvdec: use DIV_ROUND_UP() for CTB counts

Hungyu Lin (7):
      media: intel: ipu-bridge: add blank line after declarations
      media: qcom: iris: fix runtime PM reference leaks
      media: qcom: venus: add callback parameter names
      media: qcom: iris: handle runtime PM resume failure in core deinit
      media: qcom: iris: initialize OPP pointer at declaration
      media: qcom: iris: use disable_irq() during power-off
      media: qcom: camss: Rename unused macro parameter

HyeongJun An (1):
      media: s2255: bound JPEG frame size before copying into the buffer

Ilya Krutskih (1):
      media: tda18250: fix possible integer overflow

Jackson Lee (7):
      media: chips-media: wave5: Guard bit depth check with initial_info_ob=
tained
      media: chips-media: wave5: Set inst->std during default format initia=
lization
      media: chips-media: wave5: avoid skipping device_run while VPU has wo=
rk
      media: chips-media: wave5: Add timeout while stop_streaming
      media: chips-media: wave5: Defer job_finish() only when a DEC_PIC was=
 queued
      media: chips-media: wave5: Fix pipeline stall when queuing fails
      media: chips-media: wave5: Resume device before setting EOS flag

Jacopo Mondi (6):
      media: mali-c55: Add support for CCM
      media: mali-c55: Add support for RGB Gamma
      media: v4l2-isp: Rename v4l2_isp_params_buffer_size
      media: v4l2-isp: Add per-block validation callback
      media: amlogic-c3: Implement per-block validation
      media: v4l2-isp: Add helpers for stats buffer

Jai Luthra (5):
      dt-bindings: media: i2c: Add Sony IMX678
      media: i2c: imx678: Add driver for Sony IMX678
      media: Add RPPX1_PARAMS and RPPX1_STATS meta formats
      media: uapi: Add extensible param and stats blocks for RPPX1
      media: rppx1: lin: Add support for gamma sensor linearization

Jake Steinman (1):
      media: ipu-bridge: Add Himax HM1092 IR sensor

Jason-JH Lin (2):
      media: platform: mtk-mdp3: Refactor CMDQ writes for CMDQ API change
      media: platform: mtk-mdp3: Change cmdq_pkt_jump_rel() to cmdq_pkt_jum=
p_rel_temp()

Jiangong.Han (1):
      media: em28xx: fix use-after-free of dev_next->devlist on disconnect

Johan Hovold (1):
      media: platform: mtk-mdp3: fix NULL deref on failed SCP lookup

Jonas Karlman (1):
      media: cec: core: Fix kmemleak due to missed rc_free_device() call

Joseph Breihan (1):
      media: au0828: add support for Monoprice 106456 USB ATSC/QAM tuner

Jos=C3=A9 Mar=C3=ADa Mart=C3=ADn (1):
      media: ipu-bridge: check all DMI entries when overriding sensor rotat=
ion

Julian Braha (1):
      media: platform: amd: fix unmet dependency for VIDEO_V4L2_SUBDEV_API

Junrui Luo (1):
      media: vicodec: fix out-of-bounds write in FWHT encoder

Jurison Murati (2):
      media: i2c: ov8865: Drop the runtime PM usage count on stream failure
      media: i2c: ov8865: Program the sensor on stream start

Kate Hsuan (4):
      media: ipu-bridge: Add DMI information of Lenovo X9 to the image upsi=
de-down list
      media: ipu-bridge: Add Sony IMX471 for Lenovo X1 Carbon G14
      platform: int3472: discrete: con_id vana for Sony IMX471 as power ena=
ble
      media: i2c: imx471: Add Sony IMX471 image sensor driver

Lad Prabhakar (3):
      media: dt-bindings: media: renesas,fcp: Document RZ/T2H and RZ/N2H So=
Cs
      media: dt-bindings: media: renesas,vsp1: Document RZ/T2H and RZ/N2H S=
oCs
      media: renesas: vsp1: Make reset control optional to support platform=
s without a reset line

Laurent Pinchart (3):
      media: i2c: cvs: Pass link frequency explicitly to csi_set_link_cfg()
      media: nxp: imx8-isi: Drop unneeded downscaling factor clamping
      media: renesas: vsp1: Declare index variables in for loop statement

Laurentiu Palcu (1):
      media: nxp: imx8-isi: Add 16-bit raw Bayer format support

Lei Huang (18):
      media: s2255: check firmware size before reading trailing marker
      media: s2255: Rename CamelCase goto labels to snake_case
      media: s2255: Rename remaining CamelCase identifiers to snake_case
      media: s2255: Remove unnecessary spaces after casts
      media: s2255: Use consistent braces on all arms of if/else statements
      media: s2255: Replace NULL comparisons with ! notation
      media: s2255: Fix alignment to match open parenthesis
      media: s2255: Remove multiple blank lines and before close braces
      media: s2255: Add blank lines after function/struct/enum declarations
      media: s2255: Add spaces around multiplication operators
      media: s2255: Remove unnecessary parentheses around conditions
      media: s2255: Parenthesize macro argument to avoid precedence issues
      media: s2255: Add blank lines after variable declarations
      media: s2255: Fix block comment style to kernel format
      media: s2255: Remove unnecessary return statements from void functions
      media: s2255: Remove unnecessary debug logging and out-of-memory mess=
ages
      media: s2255: Remove unnecessary braces from single-statement blocks
      media: s2255: Replace bare 'unsigned' with 'unsigned int'

Link Mauve (2):
      media: ov2740: define most fields on variable declaration
      media: ov2740: move regmap_config to a static const variable

Linmao Li (2):
      media: rcar-isp: Release ISPCORE resources
      media: rcar-isp: Fix VSPX reference leaks

Linus Walleij (1):
      media: camif-core: Drop GPIO handling

Luciano Ciccariello (1):
      media: em28xx: Add StarTech SVID2USB232

Martin Hecht (1):
      media: i2c: alvium: Fix: Correct name of register in alvium_set_ctrl_=
auto_exposure

Michael Bommarito (3):
      media: rkvdec: hevc: tighten EXT SPS RPS control dimensions
      media: v4l2-ctrls: validate HEVC EXT SPS RPS counts
      media: rkvdec: hevc: guard INTER_REF_PIC_SET_PRED index underflow

Mihail Antsev (1):
      media: ipu-bridge: Add upside-down sensor DMI quirk for Samsung Galax=
y Book5 Pro 360

Ming Qian (2):
      media: amphion: Remove obsolete frame_count check in venc_start_sessi=
on
      media: v4l2-ctrls: Allow unknown HDR10 white point and luminance

Mohammed EL Kadiri (3):
      media: venus: fix payload size returned by parse_caps() and parse_all=
oc_mode()
      media: venus: fix payload size calculation in parse_raw_formats()
      media: venus: Annotate flex arrays with __counted_by()

Myeonghun Pak (1):
      media: rc: sunxi-cir: Unregister rc device on probe failure

Narasimharao Vadlamudi (3):
      media: rkvdec: Propagate platform_get_irq() errors
      media: i2c: imx415: Return test pattern write errors
      media: i2c: imx415: Release runtime PM reference on VBLANK error

Nihal Kumar Gupta (1):
      dt-bindings: media: qcom: Add Shikra CAMSS compatible

Niklas S=C3=B6derlund (10):
      media: rppx1: Add framework to support Dreamchip RPPX1 ISP
      media: rcar-isp: Add support for ISPCORE
      media: rppx1: wbmeas: Add support for white balance measurement
      media: rppx1: awbg: Add support for white balance gain settings
      media: rppx1: exm: Add support for exposure measurement
      media: rppx1: hist: Add support histogram measurement
      media: rppx1: bls: Add support for black level compensation
      media: rppx1: ccor: Add support for color correction matrix
      media: rppx1: lsc: Add support for lens shade correction
      media: rppx1: ga: Add support for gamma out correction

Oliver Neukum (2):
      media: stk1160: cleanup error handling in probe
      media: stk1160: handle ESHUTDOWN gracefully

Pan Chuang (3):
      media: cec: ao-cec: Remove redundant dev_err()
      media: cec: seco: Remove redundant dev_err()
      media: cec: tegra: Remove redundant dev_err()

Pengpeng Hou (6):
      media: cec: stm32: return an error when log-address wait times out
      media: cec: tegra: add missing MODULE_DEVICE_TABLE()
      media: cx18: stop VBI start-code scan before short tail
      media: ivtv: stop VBI start-code scan before short tail
      media: stm32: dcmi: Propagate runtime resume errors
      media: stm32: dcmipp: Propagate runtime resume errors

Ricardo Ribalda (14):
      media: ov9282: Remove unused kerneldoc description
      media: rzg2l-cru: Remove unused kerneldoc description
      media: mc-entity: Add missing kerneldoc
      media: Documentation: Add myself as maintainer for media-ci
      media: em28xx-video: Remove unneeded semicolons
      media: iris: Replace ternary conditionals with max()
      media: vimc: Fix prototype of vimc_sensor_update_frame_timing
      media: vimc: Ensure that pixel_rate fits in 32 bits
      media: platform: amd: use refcount_t instead of atomic_t
      media: dvb-frontends/helene: Rename priv variable
      media: drivers/media/dvb-core: Split dvb_frontend_open()
      media: drivers/media/dvb-core: Refactor dvb_frontend_open locking
      media: drivers/media/dvb-core: CodeStyle for dvb_frontend_open()
      media: atomisp: Demote all broken kernel-doc comments

Richard Leitner (1):
      media: i2c: ov9282: restore flash duration calculation

Rituparna Warwatkar (1):
      media: dvb-core: fix feed leak on failed DMX_ADD_PID

Ruoyu Wang (4):
      media: cec: Serialize exclusive follower delivery
      media: ipu6: Do not free aux device pdata after init
      media: cobalt: Avoid freeing ALSA private data twice
      media: zoran: Avoid freeing a registered video_device twice

Sakari Ailus (2):
      MAINTAINERS: Merge int3472 driver patches via the media tree by defau=
lt
      dt-bindings: media: i2c: Add Sony IMX678

Samuele Angioli (1):
      media: ipu-bridge: Add DMI quirk for Dell 16 Premium DA16250

Sang-Heon Jeon (1):
      media: remove conditional return with no effect

Sanjay Chitroda (1):
      media: i2c: gc0310: Use devm_v4l2_sensor_clk_get()

Sean Young (4):
      media: keymaps: Remove obsolete RC_MAP_RC5_TV keymap define
      media: keymaps: Remove obsolete RC_MAP_HAUPPAUGE_NEW keymap define
      media: keymaps: Ensure module name matches RC_MAP_VIDEOMATE_K100
      media: dt-bindings: rc: Sync keymap list with latest list

Shuangpeng Bai (2):
      media: usbtv: keep device alive while ALSA card exists
      media: go7007: defer the ALSA v4l2 put until card release

Sven P=C3=BCschel (1):
      media: rockchip: rga: don't change RGB quantization

Svyatoslav Ryhel (1):
      staging: media: tegra-video: vi: Improve media graph building logic

Tarang Raval (1):
      platform: int3472: discrete: Support multiple HIDs per GPIO map entry

Tharit Tangkijwanichakul (2):
      media: videobuf2: move vb2_querybuf() kernel-doc to header
      media: imx219: add test patterns

Tommaso Merciai (1):
      media: rzg2l-cru: Align bytesperline to hardware DMA stride requireme=
nt

Uday Khare (2):
      media: video-i2c: fix kthread error pointer left in kthread_vid_cap o=
n failure
      media: i2c: mt9t112: fix incorrect PTR_ERR() call on non-error pointer

Uwe Kleine-K=C3=B6nig (The Capable Hub) (4):
      media: Drop unused assignments from pnp_device_id array
      media: ite-cir: Use an enum for the different supported device types
      media: ti: vpe: #include <linux/platform_device.h> explicitly
      media: pci: Use PCI_DEVICE macros and drop zeros from pci_device_id a=
rrays

Valery Borovsky (3):
      media: rtl2832_sdr: use vb2_video_unregister_device() on remove to fi=
x DMA leak
      media: airspy: use vb2_video_unregister_device() on disconnect to fix=
 NULL deref
      media: rtl2832_sdr: release URBs and stream buffers on start_streamin=
g() failure

Vidhu Sarwal (2):
      staging: media: ipu7: fix pm_runtime refcount leak in ipu7_init_fw_co=
de_region_by_sys()
      staging: media: ipu7: fix pm_runtime refcount leak in ipu7_resume()

Wangao Wang (2):
      media: qcom: iris: fix missing hfi_id in gen1 GOP_SIZE cap
      media: qcom: iris: Add request key frame support for encoder

Weigang He (1):
      media: cec: stm32: prevent out-of-bounds write on RX overflow

Xu Rao (1):
      media: v4l2-async: avoid deleting unlinked ASC entry on link error

Yemike Abhilash Chandra (1):
      media: ti: vpe: Select V4L2_FWNODE for VIP

Yi Ding (1):
      media: cec: meson: ao-cec-g12a: name the CEC core regmap to avoid deb=
ugfs clash

Yifei Gao (2):
      media: amd: isp4: release partial allocations in isp4if_alloc_fw_gpum=
em()
      media: amd: isp4: fix self-deadlock in isp4sd_pwron_and_init() error =
path

Yousef Alhouseen (2):
      media: go7007: avoid undefined shifts in MPEG-4 headers
      media: go7007: s2250: propagate control I/O failures

shaikh.kamal (1):
      Documentation: media: fix spelling errors

 CREDITS                                            |    7 +
 .../admin-guide/media/em28xx-cardlist.rst          |    4 +
 .../devicetree/bindings/media/i2c/sony,imx355.yaml |   11 +-
 .../devicetree/bindings/media/i2c/sony,imx678.yaml |  130 ++
 .../devicetree/bindings/media/i2c/st,vd55g1.yaml   |    3 +-
 .../devicetree/bindings/media/nxp,imx8-isi.yaml    |    4 +-
 .../devicetree/bindings/media/qcom,milos-iris.yaml |  166 ++
 .../bindings/media/qcom,qcm2290-camss.yaml         |   15 +-
 Documentation/devicetree/bindings/media/rc.yaml    |    4 +-
 .../devicetree/bindings/media/renesas,fcp.yaml     |   18 +-
 .../devicetree/bindings/media/renesas,vsp1.yaml    |   17 +-
 .../devicetree/bindings/media/ti,am437x-vpfe.yaml  |   93 +
 .../devicetree/bindings/media/ti-am437x-vpfe.txt   |   61 -
 .../driver-api/media/maintainer-entry-profile.rst  |    4 +
 .../media/cec/cec-ioc-adap-g-log-addrs.rst         |    7 +
 .../userspace-api/media/dvb/legacy_dvb_video.rst   |    2 +-
 .../media/v4l/ext-ctrls-colorimetry.rst            |   12 +-
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../userspace-api/media/v4l/metafmt-rppx1.rst      |   99 +
 Documentation/userspace-api/media/v4l/v4l2-isp.rst |   45 +-
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |   15 +-
 .../media/v4l/vidioc-subdev-g-routing.rst          |    2 +-
 MAINTAINERS                                        |   55 +-
 drivers/acpi/scan.c                                |    1 +
 drivers/media/cec/core/cec-adap.c                  |   95 +-
 drivers/media/cec/core/cec-api.c                   |    5 +-
 drivers/media/cec/core/cec-core.c                  |  117 +-
 drivers/media/cec/core/cec-pin.c                   |   18 +-
 drivers/media/cec/platform/meson/ao-cec-g12a.c     |    5 +-
 drivers/media/cec/platform/meson/ao-cec.c          |    4 +-
 drivers/media/cec/platform/seco/seco-cec.c         |    6 +-
 drivers/media/cec/platform/stm32/stm32-cec.c       |   19 +-
 drivers/media/cec/platform/tegra/tegra_cec.c       |   38 +-
 .../extron-da-hd-4k-plus/extron-da-hd-4k-plus.c    |    3 +-
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c      |   14 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c    |   13 -
 drivers/media/dvb-core/dmxdev.c                    |   11 +-
 drivers/media/dvb-core/dvb_frontend.c              |  159 +-
 drivers/media/dvb-frontends/helene.c               |   56 +-
 drivers/media/dvb-frontends/rtl2832_sdr.c          |   21 +-
 drivers/media/i2c/Kconfig                          |   23 +
 drivers/media/i2c/Makefile                         |    2 +
 drivers/media/i2c/alvium-csi2.c                    |    2 +-
 drivers/media/i2c/cvs/core.c                       |    3 +
 drivers/media/i2c/cvs/icvs.h                       |    2 -
 drivers/media/i2c/cvs/v4l2.c                       |   17 +-
 drivers/media/i2c/cx25840/cx25840-core.c           |    2 +
 drivers/media/i2c/gc0310.c                         |   30 +-
 drivers/media/i2c/imx219.c                         |   27 +-
 drivers/media/i2c/imx355.c                         | 1522 +++++----------
 drivers/media/i2c/imx412.c                         |  751 ++++---
 drivers/media/i2c/imx415.c                         |    4 +-
 drivers/media/i2c/imx471.c                         |  957 +++++++++
 drivers/media/i2c/imx678.c                         | 1447 ++++++++++++++
 drivers/media/i2c/max9286.c                        |    5 +-
 drivers/media/i2c/msp3400-driver.c                 |    3 +
 drivers/media/i2c/mt9p031.c                        |    6 +-
 drivers/media/i2c/mt9t112.c                        |    9 +-
 drivers/media/i2c/mt9v011.c                        |    3 +
 drivers/media/i2c/ov02a10.c                        |   12 +-
 drivers/media/i2c/ov2740.c                         |   37 +-
 drivers/media/i2c/ov7740.c                         |   10 +-
 drivers/media/i2c/ov8865.c                         |   44 +-
 drivers/media/i2c/ov9282.c                         |    4 +-
 drivers/media/i2c/rdacm21.c                        |    5 +-
 drivers/media/i2c/saa7115.c                        |    2 +
 drivers/media/i2c/vd55g1.c                         |  175 +-
 drivers/media/i2c/video-i2c.c                      |    8 +-
 drivers/media/pci/bt8xx/bttv-driver.c              |   12 +-
 drivers/media/pci/cobalt/cobalt-alsa-main.c        |    1 -
 drivers/media/pci/cobalt/cobalt-driver.c           |    5 +-
 drivers/media/pci/cx18/cx18-driver.c               |    5 +-
 drivers/media/pci/cx18/cx18-vbi.c                  |    2 +-
 drivers/media/pci/cx23885/cimax2.c                 |    1 +
 drivers/media/pci/cx23885/cx23885-core.c           |   10 +-
 drivers/media/pci/cx25821/cx25821-alsa.c           |    4 +-
 drivers/media/pci/cx25821/cx25821-core.c           |   10 +-
 drivers/media/pci/cx88/cx88-alsa.c                 |    6 +-
 drivers/media/pci/cx88/cx88-mpeg.c                 |    6 +-
 drivers/media/pci/cx88/cx88-video.c                |    5 +-
 drivers/media/pci/ddbridge/ddbridge-main.c         |    2 +-
 drivers/media/pci/ddbridge/ddbridge.h              |    2 +-
 drivers/media/pci/dm1105/dm1105.c                  |   10 +-
 drivers/media/pci/dt3155/dt3155.c                  |    4 +-
 drivers/media/pci/hws/hws_v4l2_ioctl.h             |    4 -
 drivers/media/pci/intel/ipu-bridge.c               |   69 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |    2 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c           |    1 +
 drivers/media/pci/intel/ipu6/ipu6.c                |   10 +-
 drivers/media/pci/ivtv/ivtv-driver.c               |    8 +-
 drivers/media/pci/ivtv/ivtv-vbi.c                  |    2 +-
 drivers/media/pci/mantis/mantis_common.h           |    8 +-
 drivers/media/pci/mgb4/mgb4_core.c                 |    6 +-
 drivers/media/pci/netup_unidvb/netup_unidvb_core.c |    2 +-
 drivers/media/pci/ngene/ngene-cards.c              |    5 +-
 drivers/media/pci/pluto2/pluto2.c                  |    5 +-
 drivers/media/pci/saa7134/saa7134-cards.c          | 2047 +++++++---------=
----
 drivers/media/pci/saa7146/hexium_gemini.c          |   22 +-
 drivers/media/pci/saa7146/hexium_orion.c           |   33 +-
 drivers/media/pci/saa7146/mxb.c                    |   10 +-
 drivers/media/pci/saa7164/saa7164-core.c           |   13 +-
 drivers/media/pci/smipcie/smipcie-main.c           |    5 +-
 drivers/media/pci/solo6x10/solo6x10-core.c         |    2 +-
 drivers/media/pci/ttpci/budget-ci.c                |    4 +-
 drivers/media/pci/ttpci/budget.c                   |    4 +-
 drivers/media/pci/tw5864/tw5864-core.c             |    4 +-
 drivers/media/pci/tw68/tw68-core.c                 |   16 +-
 drivers/media/pci/tw686x/tw686x-core.c             |   23 +-
 drivers/media/pci/zoran/zoran_card.c               |    9 +-
 drivers/media/platform/Kconfig                     |    1 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/amd/isp4/Kconfig            |    1 +
 drivers/media/platform/amd/isp4/isp4_interface.c   |   10 +-
 drivers/media/platform/amd/isp4/isp4_interface.h   |    2 +-
 drivers/media/platform/amd/isp4/isp4_subdev.c      |   30 +-
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  |   42 +-
 drivers/media/platform/amphion/venc.c              |    2 -
 .../media/platform/arm/mali-c55/mali-c55-capture.c |    4 +-
 .../media/platform/arm/mali-c55/mali-c55-core.c    |    2 +
 .../media/platform/arm/mali-c55/mali-c55-params.c  |  140 +-
 .../platform/arm/mali-c55/mali-c55-registers.h     |   15 +-
 .../media/platform/arm/mali-c55/mali-c55-resizer.c |    2 +-
 drivers/media/platform/broadcom/bcm2835-unicam.c   |    5 +-
 .../platform/chips-media/wave5/wave5-vpu-dec.c     |   64 +-
 .../platform/chips-media/wave5/wave5-vpu-enc.c     |    6 +-
 .../platform/chips-media/wave5/wave5-vpuconfig.h   |    2 +-
 drivers/media/platform/dreamchip/Kconfig           |    3 +
 drivers/media/platform/dreamchip/Makefile          |    6 +
 drivers/media/platform/dreamchip/rppx1/Kconfig     |   12 +
 drivers/media/platform/dreamchip/rppx1/Makefile    |   33 +
 .../media/platform/dreamchip/rppx1/rpp_module.c    |   39 +
 .../media/platform/dreamchip/rppx1/rpp_module.h    |  119 ++
 .../media/platform/dreamchip/rppx1/rpp_params.c    |  115 ++
 drivers/media/platform/dreamchip/rppx1/rpp_stats.c |   66 +
 drivers/media/platform/dreamchip/rppx1/rppx1.c     |  381 ++++
 drivers/media/platform/dreamchip/rppx1/rppx1.h     |  105 +
 drivers/media/platform/dreamchip/rppx1/rppx1_acq.c |  148 ++
 .../media/platform/dreamchip/rppx1/rppx1_awbg.c    |   63 +
 drivers/media/platform/dreamchip/rppx1/rppx1_bd.c  |   53 +
 .../media/platform/dreamchip/rppx1/rppx1_bdrgb.c   |   81 +
 drivers/media/platform/dreamchip/rppx1/rppx1_bls.c |  157 ++
 drivers/media/platform/dreamchip/rppx1/rppx1_cac.c |   30 +
 .../media/platform/dreamchip/rppx1/rppx1_ccor.c    |  166 ++
 drivers/media/platform/dreamchip/rppx1/rppx1_db.c  |   45 +
 .../media/platform/dreamchip/rppx1/rppx1_dpcc.c    |   77 +
 drivers/media/platform/dreamchip/rppx1/rppx1_exm.c |  127 ++
 drivers/media/platform/dreamchip/rppx1/rppx1_ga.c  |   91 +
 .../media/platform/dreamchip/rppx1/rppx1_hist.c    |  186 ++
 .../media/platform/dreamchip/rppx1/rppx1_hist256.c |   47 +
 drivers/media/platform/dreamchip/rppx1/rppx1_is.c  |   43 +
 drivers/media/platform/dreamchip/rppx1/rppx1_lin.c |  112 ++
 drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c |  188 ++
 drivers/media/platform/dreamchip/rppx1/rppx1_ltm.c |   49 +
 .../media/platform/dreamchip/rppx1/rppx1_ltmmeas.c |   42 +
 .../media/platform/dreamchip/rppx1/rppx1_outif.c   |   46 +
 .../media/platform/dreamchip/rppx1/rppx1_outregs.c |   76 +
 .../media/platform/dreamchip/rppx1/rppx1_rmap.c    |   63 +
 .../platform/dreamchip/rppx1/rppx1_rmapmeas.c      |   47 +
 .../media/platform/dreamchip/rppx1/rppx1_shrp.c    |   65 +
 .../media/platform/dreamchip/rppx1/rppx1_wbmeas.c  |  165 ++
 .../media/platform/dreamchip/rppx1/rppx1_xyz2luv.c |   27 +
 .../media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c   |    6 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-comp.h   |    6 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.c   |    6 +-
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c      |   29 +-
 .../platform/microchip/microchip-sama7g5-isc.c     |    7 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |    3 +
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |   12 +-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |  111 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |   22 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |    2 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |   79 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |   12 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   |   98 +-
 drivers/media/platform/qcom/camss/camss-ispif.c    |    4 +-
 drivers/media/platform/qcom/iris/iris_buffer.c     |  123 +-
 drivers/media/platform/qcom/iris/iris_buffer.h     |    2 +-
 drivers/media/platform/qcom/iris/iris_core.c       |   12 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      |   43 +-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |    2 +
 drivers/media/platform/qcom/iris/iris_firmware.c   |  119 +-
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   |   26 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |    5 +-
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |    1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |  905 ++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |    7 +-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |    8 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |    4 +-
 .../platform/qcom/iris/iris_platform_common.h      |   11 +-
 .../media/platform/qcom/iris/iris_platform_milos.h |   27 +
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |   46 +-
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |   10 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |    8 +-
 drivers/media/platform/qcom/iris/iris_resources.c  |   19 +-
 drivers/media/platform/qcom/iris/iris_state.c      |    4 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |   14 +-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |    4 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |    2 +-
 drivers/media/platform/qcom/venus/hfi_helper.h     |    6 +-
 drivers/media/platform/qcom/venus/hfi_msgs.c       |    2 +-
 drivers/media/platform/qcom/venus/hfi_parser.c     |    9 +-
 drivers/media/platform/qcom/venus/pm_helpers.c     |    7 +-
 drivers/media/platform/renesas/rcar-csi2.c         |    6 +-
 drivers/media/platform/renesas/rcar-isp/Kconfig    |    2 +
 drivers/media/platform/renesas/rcar-isp/Makefile   |    2 +-
 drivers/media/platform/renesas/rcar-isp/core-io.c  |  997 ++++++++++
 drivers/media/platform/renesas/rcar-isp/core.c     |  916 +++++++++
 drivers/media/platform/renesas/rcar-isp/csisp.c    |   46 +-
 .../media/platform/renesas/rcar-isp/risp-core.h    |  178 ++
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |    2 -
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c |    5 +
 drivers/media/platform/renesas/vsp1/vsp1_brx.c     |    7 +-
 drivers/media/platform/renesas/vsp1/vsp1_clu.c     |    3 +-
 drivers/media/platform/renesas/vsp1/vsp1_dl.c      |   12 +-
 drivers/media/platform/renesas/vsp1/vsp1_drm.c     |   14 +-
 drivers/media/platform/renesas/vsp1/vsp1_drv.c     |   44 +-
 drivers/media/platform/renesas/vsp1/vsp1_entity.c  |    4 +-
 drivers/media/platform/renesas/vsp1/vsp1_hgo.c     |    7 +-
 drivers/media/platform/renesas/vsp1/vsp1_hgt.c     |   13 +-
 drivers/media/platform/renesas/vsp1/vsp1_lut.c     |    3 +-
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c    |    5 +-
 drivers/media/platform/renesas/vsp1/vsp1_video.c   |   34 +-
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c     |    8 +-
 drivers/media/platform/rockchip/rga/rga3-hw.c      |   12 +-
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.c  |    3 +
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   |    4 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c |    8 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c |    8 +-
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    |    8 +-
 .../media/platform/samsung/s3c-camif/camif-core.c  |   17 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c       |   19 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |    4 +-
 drivers/media/platform/ti/Kconfig                  |    1 +
 drivers/media/platform/ti/vpe/vip.c                |   38 +-
 drivers/media/platform/verisilicon/hantro_drv.c    |   12 +-
 drivers/media/radio/radio-cadet.c                  |    4 +-
 drivers/media/radio/radio-gemtek.c                 |    4 +-
 drivers/media/rc/fintek-cir.c                      |    4 +-
 drivers/media/rc/ite-cir.c                         |   29 +-
 drivers/media/rc/keymaps/Makefile                  |    2 +-
 .../{rc-videomate-m1f.c =3D> rc-videomate-k100.c}    |    2 +-
 drivers/media/rc/nuvoton-cir.c                     |    6 +-
 drivers/media/rc/sunxi-cir.c                       |    9 +-
 drivers/media/rc/winbond-cir.c                     |    4 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c  |    4 +-
 drivers/media/test-drivers/vimc/vimc-capture.c     |    4 +-
 drivers/media/test-drivers/vimc/vimc-sensor.c      |   12 +-
 drivers/media/test-drivers/vivid/vivid-meta-out.c  |   23 +-
 drivers/media/tuners/tda18250.c                    |    4 +-
 drivers/media/usb/airspy/airspy.c                  |   17 +-
 drivers/media/usb/au0828/au0828-cards.c            |   14 +
 drivers/media/usb/au0828/au0828-cards.h            |    1 +
 drivers/media/usb/au0828/au0828-dvb.c              |    1 +
 drivers/media/usb/cx231xx/cx231xx-audio.c          |    5 +
 drivers/media/usb/cx231xx/cx231xx-video.c          |    4 +-
 drivers/media/usb/dvb-usb-v2/mxl111sf.c            |   12 +-
 drivers/media/usb/em28xx/em28xx-cards.c            |   36 +-
 drivers/media/usb/em28xx/em28xx-core.c             |    4 +-
 drivers/media/usb/em28xx/em28xx-dvb.c              |    2 +-
 drivers/media/usb/em28xx/em28xx-reg.h              |    1 +
 drivers/media/usb/em28xx/em28xx-video.c            |  114 +-
 drivers/media/usb/em28xx/em28xx.h                  |    3 +-
 drivers/media/usb/go7007/go7007-driver.c           |   14 +-
 drivers/media/usb/go7007/go7007-fw.c               |   28 +-
 drivers/media/usb/go7007/s2250-board.c             |   54 +-
 drivers/media/usb/go7007/snd-go7007.c              |   10 +-
 drivers/media/usb/gspca/jl2005bcd.c                |    7 +-
 drivers/media/usb/s2255/s2255drv.c                 |  422 ++--
 drivers/media/usb/stk1160/stk1160-core.c           |   15 +-
 drivers/media/usb/stk1160/stk1160-video.c          |    3 +
 drivers/media/usb/usbtv/usbtv-audio.c              |   11 +
 drivers/media/usb/usbtv/usbtv-core.c               |    5 +-
 drivers/media/usb/usbtv/usbtv-video.c              |    4 +-
 drivers/media/v4l2-core/v4l2-async.c               |   16 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |   68 +-
 drivers/media/v4l2-core/v4l2-dev.c                 |   28 +-
 drivers/media/v4l2-core/v4l2-fwnode.c              |    2 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 drivers/media/v4l2-core/v4l2-isp.c                 |   55 +
 drivers/platform/x86/intel/int3472/discrete.c      |   51 +-
 .../pci/base/circbuf/interface/ia_css_circbuf.h    |   40 +-
 .../base/circbuf/interface/ia_css_circbuf_comm.h   |    4 +-
 .../base/circbuf/interface/ia_css_circbuf_desc.h   |   14 +-
 .../pci/camera/util/interface/ia_css_util.h        |    2 +-
 .../pci/css_2401_system/host/csi_rx_private.h      |   18 +-
 .../pci/css_2401_system/host/isys_irq_private.h    |    4 +-
 .../host/isys_stream2mmio_private.h                |   12 +-
 .../pci/css_2401_system/host/pixelgen_private.h    |    8 +-
 .../atomisp/pci/css_2401_system/pixelgen_global.h  |    2 +-
 .../pci/hive_isp_css_common/timed_ctrl_global.h    |    2 +-
 .../device_access/device_access.h                  |    2 +-
 .../pci/hive_isp_css_include/host/csi_rx_public.h  |   18 +-
 .../host/isys_stream2mmio_public.h                 |   12 +-
 .../hive_isp_css_include/host/pixelgen_public.h    |    8 +-
 .../pci/hive_isp_css_include/host/tag_public.h     |    4 +-
 .../pci/hive_isp_css_include/platform_support.h    |    2 +-
 .../pci/hive_isp_css_include/type_support.h        |    2 +-
 .../media/atomisp/pci/ia_css_frame_public.h        |    2 +-
 .../staging/media/atomisp/pci/ia_css_host_data.h   |    4 +-
 .../staging/media/atomisp/pci/ia_css_pipe_public.h |    8 +-
 drivers/staging/media/atomisp/pci/ia_css_prbs.h    |    4 +-
 drivers/staging/media/atomisp/pci/ia_css_stream.h  |    2 +-
 drivers/staging/media/atomisp/pci/ia_css_timer.h   |    7 +-
 drivers/staging/media/atomisp/pci/ia_css_types.h   |    6 +-
 .../conversion_1.0/ia_css_conversion_types.h       |    2 +-
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8_types.h   |    2 +-
 .../atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h |   42 +-
 .../ipu2_io_ls/common/ia_css_common_io_param.h     |    2 +-
 .../ipu2_io_ls/common/ia_css_common_io_types.h     |    2 +-
 .../yuv444_io_ls/ia_css_yuv444_io.host.h           |    2 +-
 .../yuv444_io_ls/ia_css_yuv444_io_param.h          |    2 +-
 .../yuv444_io_ls/ia_css_yuv444_io_types.h          |    2 +-
 .../pci/isp/kernels/tnr/tnr3/ia_css_tnr3_types.h   |    4 +-
 .../isp/kernels/xnr/xnr_3.0/ia_css_xnr3_types.h    |   14 +-
 .../pci/isp/modes/interface/input_buf.isp.h        |    2 +-
 .../pci/runtime/binary/interface/ia_css_binary.h   |    2 +-
 .../pci/runtime/bufq/interface/ia_css_bufq.h       |   26 +-
 .../pci/runtime/debug/interface/ia_css_debug.h     |   10 +-
 .../runtime/debug/interface/ia_css_debug_pipe.h    |   10 +-
 .../pci/runtime/eventq/interface/ia_css_eventq.h   |    4 +-
 .../isp_param/interface/ia_css_isp_param_types.h   |    2 +-
 .../pci/runtime/isys/interface/ia_css_isys.h       |    8 +-
 .../runtime/pipeline/interface/ia_css_pipeline.h   |   10 +-
 .../pci/runtime/rmgr/interface/ia_css_rmgr.h       |    4 +-
 .../pci/runtime/rmgr/interface/ia_css_rmgr_vbuf.h  |   18 +-
 .../tagger/interface/ia_css_tagger_common.h        |    4 +-
 .../staging/media/atomisp/pci/sh_css_internal.h    |    4 +-
 drivers/staging/media/atomisp/pci/sh_css_sp.h      |   14 +-
 drivers/staging/media/atomisp/pci/system_global.h  |    4 +-
 drivers/staging/media/av7110/av7110.c              |   20 +-
 drivers/staging/media/ipu7/ipu7-isys.c             |    2 +
 drivers/staging/media/ipu7/ipu7.c                  |    4 +-
 drivers/staging/media/meson/vdec/vdec.c            |    4 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c        |    4 +-
 drivers/staging/media/tegra-video/tegra20.c        |    6 +-
 drivers/staging/media/tegra-video/vi.c             |   87 +-
 drivers/staging/media/tegra-video/vip.c            |   10 +-
 include/media/cec.h                                |    6 +-
 include/media/drv-intf/s3c_camif.h                 |    2 -
 include/media/drv-intf/saa7146.h                   |   11 +-
 include/media/media-entity.h                       |    1 +
 include/media/rc-map.h                             |    2 -
 include/media/rppx1.h                              |   36 +
 include/media/v4l2-ioctl.h                         |    4 +-
 include/media/v4l2-isp.h                           |   94 +-
 include/media/videobuf2-v4l2.h                     |   13 +
 include/uapi/linux/cec.h                           |    2 +
 include/uapi/linux/media/arm/mali-c55-config.h     |   86 +-
 include/uapi/linux/media/dreamchip/rppx1-config.h  |  730 +++++++
 include/uapi/linux/media/v4l2-isp.h                |  125 +-
 include/uapi/linux/videodev2.h                     |    4 +
 351 files changed, 14636 insertions(+), 4658 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx678=
.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,milos-iris=
.yaml
 create mode 100644 Documentation/devicetree/bindings/media/ti,am437x-vpfe.=
yaml
 delete mode 100644 Documentation/devicetree/bindings/media/ti-am437x-vpfe.=
txt
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-rppx1.rst
 create mode 100644 drivers/media/i2c/imx471.c
 create mode 100644 drivers/media/i2c/imx678.c
 create mode 100644 drivers/media/platform/dreamchip/Kconfig
 create mode 100644 drivers/media/platform/dreamchip/Makefile
 create mode 100644 drivers/media/platform/dreamchip/rppx1/Kconfig
 create mode 100644 drivers/media/platform/dreamchip/rppx1/Makefile
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_module.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_module.h
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_params.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_stats.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1.h
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_acq.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_bd.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_bdrgb.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_cac.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_db.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_dpcc.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_hist256.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_is.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ltm.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ltmmeas.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_outif.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_outregs.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_rmap.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_rmapmeas.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_shrp.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_xyz2luv.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_platform_milos.h
 create mode 100644 drivers/media/platform/renesas/rcar-isp/core-io.c
 create mode 100644 drivers/media/platform/renesas/rcar-isp/core.c
 create mode 100644 drivers/media/platform/renesas/rcar-isp/risp-core.h
 rename drivers/media/rc/keymaps/{rc-videomate-m1f.c =3D> rc-videomate-k100=
.c} (97%)
 create mode 100644 include/media/rppx1.h
 create mode 100644 include/uapi/linux/media/dreamchip/rppx1-config.h
