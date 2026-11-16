Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.239.118.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864921;
	b=ggihfOCA9nxuKxeEUkzsRsAwR318vjR8NPsPTvayIB6i3PKdTOWCmmzrUDRWsE8NUFDT
	 FbwKVzyOh3h3ArOBiYO7WPlK5NbJN1fnutr6NqfNgwRphM1ylQYrXt0+Fo8x5oxSFnZuq
	 0uyIGg0p+1g1abcNTjEcolNH4Cb4DaQ3HDPZkwN7Zfi3kP7FkARwdojK2uMFYpJS2JB3M
	 uPUlJS+JmrXkZnYVZMo0dIHHX7mw6sLrC+dvzr02HMLbvWQ1uQlByVmEj6ZV5WfZGdUQi
	 gTYAJdQmW/+sxycRXcSiNw2SJmX4jieg6wAdRS5jmTaPqbsjY91lUpqIzmXQirTZT0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864921;
	h=DMARC-Filter:DKIM-Signature:Received:X-ImunifyEmail-Filter-Score:
	 X-ImunifyEmail-Filter-Version:X-ImunifyEmail-Filter-Info:
	 X-ImunifyEmail-Filter-Action:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Get-Message-Sender-Via:
	 X-Authenticated-Sender:X-Source:X-Source-Args:X-Source-Dir;
	bh=nSkc5QOw73OJXNVhR+dXUmrFIoNnEXSrMbLh7oce0Q0=;
	b=iscn7x93tAui23I2BqCmNAEYRlLq82SvMxSH2aWoTvou0wFm5OgaANK/x86QcTvSVjC9
	 bBhBYoi5AMbXK7hMM9msd+ffPL1yZ5ZolHSC9WhWThIbEigYK2yTcDLrFScWE4F0iL4Xz
	 QDF3hChjHKpaNnlvS4zleAaszUqacfj20bUCCelDQY6iqz+mYt9KiA1eP6Iiq03jxg4wV
	 H9jD4UQxaTfhlcLea2YgFQeDKtQWECdg9HQnUnl8faUVys8kMyinpPyb0jhrPj4dtdhYn
	 mb3hUl0yT3e6RM1XeDS5PdK8j91IkVi3jq2whjs9+Axas87YXGKIjyUev666SXBx1Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jordan-systems.de;
	spf=pass smtp.mailfrom=jordan-systems.de;
	dkim=pass header.d=jordan-systems.de header.i=@jordan-systems.de header.a=rsa-sha256 header.s=default header.b=ZXQxcHi5;
	arc=none smtp.remote-ip=91.239.118.30
Received: from cp3.greenwebspace.net (cp3.greenwebspace.net [91.239.118.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475BA606A339
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 21:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 475BA606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jordan-systems.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jordan-systems.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jordan-systems.de header.i=@jordan-systems.de header.a=rsa-sha256 header.s=default header.b=ZXQxcHi5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=jordan-systems.de; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=nSkc5QOw73OJXNVhR+dXUmrFIoNnEXSrMbLh7oce0Q0=; b=ZXQxcHi5nY5Z
	ePRkgWThG/eom/K3koKOKwLZQ9goVInZsdJeo7IEmraksL0YS/lgZ+BZ0ahzVUxTh5HJ54gTNj2BL
	8W1qqBD0uIDiD5M0O1n03cnVGRD1GmF0INOH5xCXzthxtX3PqsEeDb/yLxJCoald5SWC3EqY2TYFw
	NGyU8bXyKgUGGIzWVZFKYLncOl/WyRlL68vLAV1HizuqS0aewoIeuOBtO8cFTMa/tSKkYc60i17Kf
	JBIiVFBxcz3oBCAapwJ8Le6vJGGbcWsVoDPi9KrfLhd8WYDnc5wUf6LLb3FzWwZ7ZcTaeOznrmNJd
	x7GnhV0OwyTDgff6FOZqzA==;
Received: from mailnull by cp3.greenwebspace.net with spam-scanner (Exim 4.100.1)
	(envelope-from <service@jordan-systems.de>)
	id 1xT4M1-0000000Gt7g-2cjK
	for linux-media@vger.kernel.org;
	Mon, 16 Nov 2026 22:35:09 +0100
X-ImunifyEmail-Filter-Score: -3.03
X-ImunifyEmail-Filter-Version: 3.8.28/202611120940
X-ImunifyEmail-Filter-Info: TUlNRV9VTktOT1dOIFJDVkRfQ09VTlRfT05FIEJBWUVTX0hB
	TSBWRVJ
		JTE9DS19DQiBNSURfUkhTX01BVENIX0ZST00gQVNOIEZST01fSEFTX0
		ROIFJDVkRfVExTX0FMTCBSQ1ZEX1ZJQV9TTVRQX0FVVEggVE9fTUFUQ
		0hfRU5WUkNQVF9TT01FIEFSQ19OQSBJRV9WTF9BR0VfRE9NQUlOXzJX
		IFJDUFRfQ09VTlRfVEhSRUUgTUlNRV9UUkFDRSBJRV9WTF9BR0VfQUN
		DT1VOVF8yVyBYTV9VQV9OT19WRVJTSU9OIFRPX0ROX1NPTUUgSUVfVk
		xfQUdFX0VNQUlMXzJXIEZST01fRVFfRU5WRlJPTQ==
X-ImunifyEmail-Filter-Action: no action
Received: from ip-109-41-176-2.web.vodafone.de ([109.41.176.2]:30015 helo=[192.168.178.186])
	by cp3.greenwebspace.net with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <service@jordan-systems.de>)
	id 1xT4M2-0000000Gt6j-203u;
	Mon, 16 Nov 2026 22:35:08 +0100
Message-ID: <c2c00ad1-b21c-42f9-b3a1-e03a0ad49651@jordan-systems.de>
Date: Mon, 16 Nov 2026 22:35:06 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] uvcvideo: DJI Osmo Pocket 4P (2ca3:0023): HEVC format has
 sizeimage 0, VIDIOC_REQBUFS fails with EINVAL
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hansg@kernel.org
References: <2e522ada-8a66-4803-adb9-ed8edc33a3d2@jordan-systems.de>
 <CANiDSCviWGBhTRPo7S1MV5pq+6yLc3vxt9XEWd34wLUhzR3F0A@mail.gmail.com>
Content-Language: de-DE
From: Jordan Moormann <service@jordan-systems.de>
In-Reply-To: <CANiDSCviWGBhTRPo7S1MV5pq+6yLc3vxt9XEWd34wLUhzR3F0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp3.greenwebspace.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - jordan-systems.de
X-Get-Message-Sender-Via: cp3.greenwebspace.net: authenticated_id: service@jordan-systems.de
X-Authenticated-Sender: cp3.greenwebspace.net: service@jordan-systems.de
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi Ricardo,

thanks for the quick reply. The hack fixes the issue for me.

Tested on 7.3.4-x64v3-xanmod1 with only uvcvideo rebuilt from the
7.3.4 sources plus your two changes.

   $ v4l2-ctl -d /dev/video2 \
       --set-fmt-video=width=1920,height=1080,pixelformat=HEVC \
       --get-fmt-video
   Format Video Capture:
         Width/Height      : 1920/1080
         Pixel Format      : 'HEVC' (HEVC)
         Bytes per Line    : 0
         Size Image        : 1866240

Streaming works, no WARNING anymore:

   $ v4l2-ctl -d /dev/video2 \
       --set-fmt-video=width=1920,height=1080,pixelformat=HEVC \
       --stream-mmap --stream-count=150 --stream-to=test.hevc

The resulting file plays fine with ffplay, which reports
"hevc (Main), yuv420p(tv, bt709), 1920x1080".
3840x2160 HEVC works as well.

Output of the new debug message (1920x1080):

uvcvideo 1-3:1.0: probe (GET_MIN): fmt 2 frame 1 dwMaxVideoFrameSize 
1866240 dwMaxPayloadTransferSize 1866240
uvcvideo 1-3:1.0: probe (GET_MAX): fmt 2 frame 1 dwMaxVideoFrameSize 
1866240 dwMaxPayloadTransferSize 1866240
uvcvideo 1-3:1.0: probe (GET_CUR): fmt 2 frame 1 dwMaxVideoFrameSize 
1866240 dwMaxPayloadTransferSize 1866240

So the device does report a sane dwMaxVideoFrameSize itself.

I am happy to test the proper patch as well.

Thanks,
Jordan


> Hi Jordan, thanks for the detailed report
>
> Could you try if the following hack fixes the issue for you? If so I
> can prepare a proper patch for this kind of errors:
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c
> b/drivers/media/usb/uvc/uvc_driver.c
> index cbc14569716b..c84499e4b2c6 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -413,7 +413,7 @@ static int uvc_parse_format(struct uvc_device *dev,
>                          ftype = UVC_VS_FRAME_UNCOMPRESSED;
>                  } else {
>                          ftype = UVC_VS_FRAME_FRAME_BASED;
> -                       if (buffer[27])
> +                       if (buffer[27] || !format->bpp)
>                                  format->flags = UVC_FMT_FLAG_COMPRESSED;
>                  }
>                  break;
> diff --git a/drivers/media/usb/uvc/uvc_video.c
> b/drivers/media/usb/uvc/uvc_video.c
> index a92a986ab714..c95ec18589a1 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -365,6 +365,12 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
>                  ctrl->bMaxVersion = 0;
>          }
>
> +       uvc_dbg(stream->dev, VIDEO,
> +               "%s (%s): fmt %u frame %u dwMaxVideoFrameSize %u
> dwMaxPayloadTransferSize %u\n",
> +               probe ? "probe" : "commit", uvc_query_name(query),
> +               ctrl->bFormatIndex, ctrl->bFrameIndex,
> +               ctrl->dwMaxVideoFrameSize, ctrl->dwMaxPayloadTransferSize);
> +
>          /*
>           * Some broken devices return null or wrong dwMaxVideoFrameSize and
>           * dwMaxPayloadTransferSize fields. Try to get the value from the
>
> Thanks!
>
> On Sat, 14 Nov 2026 at 00:34, Jordan Moormann <service@jordan-systems.de> wrote:
>> Hi,
>>
>> the DJI Osmo Pocket 4P in webcam mode exposes two formats, MJPEG and
>> HEVC (frame-based). MJPEG works fine. Selecting HEVC succeeds, but
>> sizeimage is 0, and VIDIOC_REQBUFS then fails with EINVAL and triggers a
>> WARNING in vb2_core_reqbufs(). HEVC streaming is therefore not
>> possible with any application.
>>
>> Device:   DJI Osmo Pocket 4P, USB ID 2ca3:0023, bcdDevice 5.04,
>>                   Device firmware: 01.02.11.49 (most recent by the time
>> of writing)
>>                   Camera firmware: 10.00.15.69
>> Kernel:   7.3.3-x64v3-xanmod1 (XanMod, not a vanilla kernel), x86_64
>> Distro:   LMDE 7
>> Host:     Lenovo ThinkPad T560, device connects at High Speed
>>
>> Steps to reproduce:
>>
>>     $ v4l2-ctl -d /dev/video2 \
>>         --set-fmt-video=width=1920,height=1080,pixelformat=HEVC \
>>         --get-fmt-video
>>     Format Video Capture:
>>           Width/Height      : 1920/1080
>>           Pixel Format      : 'HEVC' (HEVC)
>>           Field             : None
>>           Bytes per Line    : 0
>>           Size Image        : 0
>>           ...
>>
>>     $ v4l2-ctl -d /dev/video2 \
>>         --set-fmt-video=width=1920,height=1080,pixelformat=HEVC \
>>         --stream-mmap --stream-count=1
>>                   VIDIOC_REQBUFS returned -1 (Invalid argument)
>>
>> The same happens for all four HEVC frame sizes I tried.
>>
>> Observations:
>>
>> - The device reports bcdUVC 1.00.
>> - HEVC is described by a FORMAT_FRAME_BASED descriptor with
>>     guidFormat {35363248-0000-0010-8000-00aa00389b71} ("H265"),
>>     bVariableSize 0, bBitsPerPixel 0.
>> - The FRAME_FRAME_BASED descriptors have dwBytesPerLine 0 and, by
>> definition, no dwMaxVideoFrameBufferSize.
>> - I assume the device also returns dwMaxVideoFrameSize = 0 in the
>> probe/commit response, so the driver has no source for a buffer
>>     size. I have not captured the raw probe response; I can do so (e.g.
>> with usbmon) if that helps.
>>
>> Kernel log with uvcvideo trace=0xffff:
>>
>> [72643.684562] uvcvideo 1-4:1.0: uvc_v4l2_open
>> [72643.800333] uvcvideo 1-4:1.0: Resuming interface 0
>> [72643.800341] uvcvideo 1-4:1.0: Resuming interface 1
>> [72643.802018] uvcvideo 1-4:1.0: Trying format 0x43564548 (HEVC): 1920x1080
>> [72643.802026] uvcvideo 1-4:1.0: Using default frame interval 33333.3 us
>> (30.0 fps)
>> [72643.816709] uvcvideo 1-4:1.0: Control 0x00980927 not found
>> [72643.816830] uvcvideo 1-4:1.0: Control 0x00980928 not found
>> [72643.817075] ------------[ cut here ]------------
>> [72643.817078] WARNING: at vb2_core_reqbufs+0x60e/0x630
>> [videobuf2_common], CPU#1: v4l2-ctl/784500
>> [72643.817091] Modules linked in: rndis_host cdc_ether usbnet uas mii
>> usb_storage snd_usb_audio snd_usbmidi_lib snd_ump snd_rawmidi loop ufs
>> hfsplus hfs cdrom minix ntfs msdos jfs nls_ucs2_utils xfs ccm
>> snd_seq_dummy snd_hrtimer nf_conntrack_netlink xt_nat xt_tcpudp veth
>> snd_seq snd_seq_device xt_conntrack xt_MASQUERADE bridge stp llc
>> xfrm_user xfrm_algo xt_set ip_set nft_chain_nat nf_nat nf_conntrack
>> nf_defrag_ipv6 nf_defrag_ipv4 xt_addrtype nft_compat nf_tables overlay
>> rfcomm algif_hash algif_skcipher af_alg bnep vfat fat
>> snd_hda_codec_intelhdmi snd_hda_codec_hdmi joydev intel_rapl_msr
>> intel_rapl_common mousedev intel_pmc_core_pltdrv intel_pmc_core
>> intel_pmc_ssram_telemetry intel_pmc_pwrm_telemetry snd_hda_codec_alc269
>> pmt_telemetry snd_hda_codec_realtek_lib mei_wdt pmt_discovery
>> snd_hda_scodec_component mei_pxp mei_hdcp pmt_class
>> snd_hda_codec_generic intel_vsec intel_tcc_cooling iwlmvm snd_hda_intel
>> snd_soc_avs x86_pkg_temp_thermal mac80211 intel_powerclamp libarc4
>> snd_soc_hda_codec snd_hda_ext_core coretemp
>> [72643.817171]  snd_hda_codec uvcvideo snd_hda_core rapl intel_cstate
>> snd_intel_dspcfg uvc btusb videobuf2_v4l2 snd_intel_sdw_acpi btmtk
>> iwlwifi videobuf2_vmalloc snd_hwdep btrtl think_lmi btbcm
>> videobuf2_memops snd_soc_core btintel snd_ctl_led intel_uncore
>> videobuf2_common ac97_bus pcspkr firmware_attributes_class wmi_bmof
>> rmi_smbus bluetooth cfg80211 thinkpad_acpi snd_pcm_dmaengine videodev
>> rmi_core snd_compress sparse_keymap mc snd_pcm snd_timer snd rfkill
>> soundcore intel_xhci_usb_role_switch mei_me roles mei intel_pch_thermal
>> mac_hid sg sch_fq_codel i2c_dev ecryptfs encrypted_keys trusted tee
>> asn1_encoder parport_pc dm_mod ppdev lp parport ip_tables x_tables
>> raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor
>> async_tx raid1 raid0 linear md_mod rtsx_pci_sdmmc iTCO_wdt i915
>> intel_pmc_bxt mmc_core at24 aesni_intel intel_gtt psmouse intel_oc_wdt
>> drm_buddy gf128mul serio_raw i2c_i801 e1000e ttm i2c_mux ptp video
>> i2c_smbus pps_core rtsx_pci drm_display_helper i2c_algo_bit cec wmi
>> [72643.817269] CPU: 1 UID: 1000 PID: 784500 Comm: v4l2-ctl Tainted: G
>>       W           7.3.3-x64v3-xanmod1 #0~20261107.g2ef8115 PREEMPT(lazy)
>> 794c6dd48f7cf8ffeb5069cf55e906b2d13cab42
>> [72643.817276] Tainted: [W]=WARN
>> [72643.817278] Hardware name: LENOVO 20FJS0WB00/20FJS0WB00, BIOS
>> N1KET58W (1.45 ) 12/12/2022
>> [72643.817280] RIP: 0010:vb2_core_reqbufs+0x60e/0x630 [videobuf2_common]
>> [72643.817290] Code: 0f b7 83 28 01 00 00 89 c1 c1 e9 03 83 e1 08 25 77
>> ff 00 00 09 c8 35 88 00 00 00 66 89 83 28 01 00 00 45 31 ff e9 b2 fe ff
>> ff <0f> 0b e9 2c fe ff ff 0f 0b e9 d9 fe ff ff e8 3f ae 03 df 66 66 66
>> [72643.817294] RSP: 0018:ffffcd640d85faf0 EFLAGS: 00010246
>> [72643.817297] RAX: 0000000000000000 RBX: ffff8c84a8f8c560 RCX:
>> 0000000000000001
>> [72643.817300] RDX: ffffcd640d85fb18 RSI: 0000000000000000 RDI:
>> 0000000000000000
>> [72643.817302] RBP: ffffcd640d85fb80 R08: ffff8c84a8f8c5c8 R09:
>> 0000000000000000
>> [72643.817304] R10: ffff8c8280080528 R11: ffffffffc160f240 R12:
>> ffff8c84a8f8c5c8
>> [72643.817306] R13: ffff8c84a8f8c608 R14: ffffcd640d85fc90 R15:
>> 0000000000000000
>> [72643.817308] FS:  00007faca628b5c0(0000) GS:ffff8c85ef876000(0000)
>> knlGS:0000000000000000
>> [72643.817311] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [72643.817314] CR2: 00007ffe55739b28 CR3: 000000011bdaa005 CR4:
>> 00000000003706f0
>> [72643.817317] Call Trace:
>> [72643.817319]  <TASK>
>> [72643.817322]  ? __video_do_ioctl+0x32b/0x420 [videodev
>> 737f432cdba19aa158010fb7f1fa92ce311262fb]
>> [72643.817352]  vb2_ioctl_reqbufs+0x143/0x170 [videobuf2_v4l2
>> bfe30e224776ceeac1bf898a7d893e908ec47a73]
>> [72643.817360]  __video_do_ioctl+0x3be/0x420 [videodev
>> 737f432cdba19aa158010fb7f1fa92ce311262fb]
>> [72643.817387]  ? video_ioctl2+0x20/0x20 [videodev
>> 737f432cdba19aa158010fb7f1fa92ce311262fb]
>> [72643.817411]  video_usercopy+0x5a0/0x780 [videodev
>> 737f432cdba19aa158010fb7f1fa92ce311262fb]
>> [72643.817436]  ? video_ioctl2+0x20/0x20 [videodev
>> 737f432cdba19aa158010fb7f1fa92ce311262fb]
>> [72643.817463]  v4l2_ioctl+0x47/0x60 [videodev
>> 737f432cdba19aa158010fb7f1fa92ce311262fb]
>> [72643.817487]  __se_sys_ioctl+0x71/0xc0
>> [72643.817492]  do_syscall_64+0xf5/0x2d0
>> [72643.817497]  ? count_memcg_events+0x61/0x160
>> [72643.817501]  ? handle_mm_fault+0xb68/0x1410
>> [72643.817509]  ? do_user_addr_fault+0x252/0x690
>> [72643.817513]  ? irqentry_exit+0x3f/0x700
>> [72643.817518]  ? do_syscall_64+0x38/0x2d0
>> [72643.817522]  entry_SYSCALL_64_after_hwframe+0x6c/0x74
>> [72643.817526] RIP: 0033:0x7faca5e2865b
>> [72643.817555] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10
>> 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f
>> 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
>> [72643.817558] RSP: 002b:00007ffe55739690 EFLAGS: 00000246 ORIG_RAX:
>> 0000000000000010
>> [72643.817562] RAX: ffffffffffffffda RBX: 00007ffe5573a9c0 RCX:
>> 00007faca5e2865b
>> [72643.817564] RDX: 00007ffe55739770 RSI: 00000000c0145608 RDI:
>> 0000000000000003
>> [72643.817566] RBP: 00007ffe5573de40 R08: 0000000000000000 R09:
>> 0000000000000000
>> [72643.817568] R10: 00007ffe5573c2a0 R11: 0000000000000246 R12:
>> 00007ffe5573e0c0
>> [72643.817570] R13: 00007ffe55739ce0 R14: 0000000000000000 R15:
>> 0000000000000001
>> [72643.817575]  </TASK>
>> [72643.817577] ---[ end trace 0000000000000000 ]---
>> [72643.817612] uvcvideo 1-4:1.0: uvc_v4l2_release
>>
>> v4l2-ctl --list-formats-ext:
>>
>> ioctl: VIDIOC_ENUM_FMT
>>       Type: Video Capture
>>
>>       [0]: 'MJPG' (Motion-JPEG, compressed)
>>           Size: Discrete 1920x1080
>>               Interval: Discrete 0.033s (30.000 fps)
>>               Interval: Discrete 0.040s (25.000 fps)
>>               Interval: Discrete 0.042s (24.000 fps)
>>           Size: Discrete 1080x1920
>>               Interval: Discrete 0.033s (30.000 fps)
>>               Interval: Discrete 0.040s (25.000 fps)
>>               Interval: Discrete 0.042s (24.000 fps)
>>           Size: Discrete 3840x2160
>>               Interval: Discrete 0.033s (30.000 fps)
>>               Interval: Discrete 0.040s (25.000 fps)
>>               Interval: Discrete 0.042s (24.000 fps)
>>           Size: Discrete 1728x3072
>>               Interval: Discrete 0.033s (30.000 fps)
>>               Interval: Discrete 0.040s (25.000 fps)
>>               Interval: Discrete 0.042s (24.000 fps)
>>       [1]: 'HEVC' (HEVC, compressed)
>>           Size: Discrete 1920x1080
>>               Interval: Discrete 0.033s (30.000 fps)
>>               Interval: Discrete 0.040s (25.000 fps)
>>               Interval: Discrete 0.042s (24.000 fps)
>>           Size: Discrete 1080x1920
>>               Interval: Discrete 0.033s (30.000 fps)
>>               Interval: Discrete 0.040s (25.000 fps)
>>               Interval: Discrete 0.042s (24.000 fps)
>>           Size: Discrete 3840x2160
>>               Interval: Discrete 0.033s (30.000 fps)
>>               Interval: Discrete 0.040s (25.000 fps)
>>               Interval: Discrete 0.042s (24.000 fps)
>>           Size: Discrete 1728x3072
>>               Interval: Discrete 0.033s (30.000 fps)
>>               Interval: Discrete 0.040s (25.000 fps)
>>               Interval: Discrete 0.042s (24.000 fps)
>>
>> lsusb -v -d 2ca3:0023:
>>
>> Bus 001 Device 017: ID 2ca3:0023 DJI Technology Co., Ltd.
>> OsmoPocket4P-ANHXP8900B1DBH
>> Negotiated speed: High Speed (480Mbps)
>> Device Descriptor:
>>     bLength                18
>>     bDescriptorType         1
>>     bcdUSB               2.01
>>     bDeviceClass          239 Miscellaneous Device
>>     bDeviceSubClass         2 [unknown]
>>     bDeviceProtocol         1 Interface Association
>>     bMaxPacketSize0        64
>>     idVendor           0x2ca3 DJI Technology Co., Ltd.
>>     idProduct          0x0023 OsmoPocket4P-ANHXP8900B1DBH
>>     bcdDevice            5.04
>>     iManufacturer           1 DJI
>>     iProduct                2 OsmoPocket4P-ANHXP8900B1DBH
>>     iSerial                 3 123456789ABCDEF
>>     bNumConfigurations      1
>>     Configuration Descriptor:
>>       bLength                 9
>>       bDescriptorType         2
>>       wTotalLength       0x029d
>>       bNumInterfaces          5
>>       bConfigurationValue     1
>>       iConfiguration          4 uvc,uac1
>>       bmAttributes         0x80
>>         (Bus Powered)
>>       MaxPower              500mA
>>       Interface Association:
>>         bLength                 8
>>         bDescriptorType        11
>>         bFirstInterface         0
>>         bInterfaceCount         2
>>         bFunctionClass         14 Video
>>         bFunctionSubClass       3 Video Interface Collection
>>         bFunctionProtocol       0
>>         iFunction               5 OsmoPocket4P
>>       Interface Descriptor:
>>         bLength                 9
>>         bDescriptorType         4
>>         bInterfaceNumber        0
>>         bAlternateSetting       0
>>         bNumEndpoints           1
>>         bInterfaceClass        14 Video
>>         bInterfaceSubClass      1 Video Control
>>         bInterfaceProtocol      0
>>         iInterface              5 OsmoPocket4P
>>         VideoControl Interface Descriptor:
>>           bLength                13
>>           bDescriptorType        36
>>           bDescriptorSubtype      1 (HEADER)
>>           bcdUVC               1.00
>>           wTotalLength       0x004e
>>           dwClockFrequency       48.000000MHz
>>           bInCollection           1
>>           baInterfaceNr( 0)       1
>>         VideoControl Interface Descriptor:
>>           bLength                18
>>           bDescriptorType        36
>>           bDescriptorSubtype      2 (INPUT_TERMINAL)
>>           bTerminalID             1
>>           wTerminalType      0x0201 Camera Sensor
>>           bAssocTerminal          0
>>           iTerminal               0
>>           wObjectiveFocalLengthMin      0
>>           wObjectiveFocalLengthMax      0
>>           wOcularFocalLength            0
>>           bControlSize                  3
>>           bmControls           0x00007a00
>>             Zoom (Absolute)
>>             PanTilt (Absolute)
>>             PanTilt (Relative)
>>             Roll (Absolute)
>>             Roll (Relative)
>>         VideoControl Interface Descriptor:
>>           bLength                12
>>           bDescriptorType        36
>>           bDescriptorSubtype      5 (PROCESSING_UNIT)
>>           bUnitID                 2
>>           bSourceID               1
>>           wMaxMultiplier      16384
>>           bControlSize            2
>>           bmControls     0x00000000
>>           iProcessing             0
>>           bmVideoStandards     0x00
>>         VideoControl Interface Descriptor:
>>           bLength                 9
>>           bDescriptorType        36
>>           bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>>           bTerminalID             3
>>           wTerminalType      0x0101 USB Streaming
>>           bAssocTerminal          0
>>           bSourceID               2
>>           iTerminal               0
>>         VideoControl Interface Descriptor:
>>           bLength                26
>>           bDescriptorType        36
>>           bDescriptorSubtype      6 (EXTENSION_UNIT)
>>           bUnitID                 6
>>           guidExtensionCode  {41769ea2-04de-e347-8b2b-f4341aff003b}
>>           bNumControls            2
>>           bNrInPins               1
>>           baSourceID( 0)          2
>>           bControlSize            1
>>           bmControls( 0)       0x07
>>           iExtension              0
>>         Endpoint Descriptor:
>>           bLength                 7
>>           bDescriptorType         5
>>           bEndpointAddress     0x81  EP 1 IN
>>           bmAttributes            3
>>             Transfer Type            Interrupt
>>             Synch Type               None
>>             Usage Type               Data
>>           wMaxPacketSize     0x0010  1x 16 bytes
>>           bInterval               8
>>           VideoControl Endpoint Descriptor:
>>             bLength                 5
>>             bDescriptorType        37
>>             bDescriptorSubtype      3 (EP_INTERRUPT)
>>             wMaxTransferSize       16
>>       Interface Descriptor:
>>         bLength                 9
>>         bDescriptorType         4
>>         bInterfaceNumber        1
>>         bAlternateSetting       0
>>         bNumEndpoints           1
>>         bInterfaceClass        14 Video
>>         bInterfaceSubClass      2 Video Streaming
>>         bInterfaceProtocol      0
>>         iInterface              6 Video Streaming
>>         VideoStreaming Interface Descriptor:
>>           bLength                            15
>>           bDescriptorType                    36
>>           bDescriptorSubtype                  1 (INPUT_HEADER)
>>           bNumFormats                         2
>>           wTotalLength                   0x016c
>>           bEndpointAddress                 0x82  EP 2 IN
>>           bmInfo                              0
>>           bTerminalLink                       3
>>           bStillCaptureMethod                 0
>>           bTriggerSupport                     0
>>           bTriggerUsage                       0
>>           bControlSize                        1
>>           bmaControls( 0)                     0
>>           bmaControls( 1)                     0
>>         VideoStreaming Interface Descriptor:
>>           bLength                            11
>>           bDescriptorType                    36
>>           bDescriptorSubtype                  6 (FORMAT_MJPEG)
>>           bFormatIndex                        1
>>           bNumFrameDescriptors                4
>>           bFlags                              0
>>             Fixed-size samples: No
>>           bDefaultFrameIndex                  1
>>           bAspectRatioX                       0
>>           bAspectRatioY                       0
>>           bmInterlaceFlags                 0x00
>>             Interlaced stream or variable: No
>>             Fields per frame: 1 fields
>>             Field 1 first: No
>>             Field pattern: Field 1 only
>>           bCopyProtect                        0
>>         VideoStreaming Interface Descriptor:
>>           bLength                            38
>>           bDescriptorType                    36
>>           bDescriptorSubtype                  7 (FRAME_MJPEG)
>>           bFrameIndex                         1
>>           bmCapabilities                   0x00
>>             Still image unsupported
>>           wWidth                           1920
>>           wHeight                          1080
>>           dwMinBitRate                 32000000
>>           dwMaxBitRate                 96000000
>>           dwMaxVideoFrameBufferSize     1843200
>>           dwDefaultFrameInterval         333333
>>           bFrameIntervalType                  3
>>           dwFrameInterval( 0)            333333
>>           dwFrameInterval( 1)            400000
>>           dwFrameInterval( 2)            416666
>>         VideoStreaming Interface Descriptor:
>>           bLength                            38
>>           bDescriptorType                    36
>>           bDescriptorSubtype                  7 (FRAME_MJPEG)
>>           bFrameIndex                         2
>>           bmCapabilities                   0x00
>>             Still image unsupported
>>           wWidth                           1080
>>           wHeight                          1920
>>           dwMinBitRate                 32000000
>>           dwMaxBitRate                 96000000
>>           dwMaxVideoFrameBufferSize     1843200
>>           dwDefaultFrameInterval         333333
>>           bFrameIntervalType                  3
>>           dwFrameInterval( 0)            333333
>>           dwFrameInterval( 1)            400000
>>           dwFrameInterval( 2)            416666
>>         VideoStreaming Interface Descriptor:
>>           bLength                            38
>>           bDescriptorType                    36
>>           bDescriptorSubtype                  7 (FRAME_MJPEG)
>>           bFrameIndex                         3
>>           bmCapabilities                   0x00
>>             Still image unsupported
>>           wWidth                           3840
>>           wHeight                          2160
>>           dwMinBitRate                111974400
>>           dwMaxBitRate                223948800
>>           dwMaxVideoFrameBufferSize     3732480
>>           dwDefaultFrameInterval         333333
>>           bFrameIntervalType                  3
>>           dwFrameInterval( 0)            333333
>>           dwFrameInterval( 1)            400000
>>           dwFrameInterval( 2)            416666
>>         VideoStreaming Interface Descriptor:
>>           bLength                            38
>>           bDescriptorType                    36
>>           bDescriptorSubtype                  7 (FRAME_MJPEG)
>>           bFrameIndex                         4
>>           bmCapabilities                   0x00
>>             Still image unsupported
>>           wWidth                           1728
>>           wHeight                          3072
>>           dwMinBitRate                111974400
>>           dwMaxBitRate                223948800
>>           dwMaxVideoFrameBufferSize     3732480
>>           dwDefaultFrameInterval         333333
>>           bFrameIntervalType                  3
>>           dwFrameInterval( 0)            333333
>>           dwFrameInterval( 1)            400000
>>           dwFrameInterval( 2)            416666
>>         VideoStreaming Interface Descriptor:
>>           bLength                            28
>>           bDescriptorType                    36
>>           bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
>>           bFormatIndex                        2
>>           bNumFrameDescriptors                4
>>           guidFormat {35363248-0000-0010-8000-00aa00389b71}
>>           bBitsPerPixel                       0
>>           bDefaultFrameIndex                  1
>>           bAspectRatioX                       0
>>           bAspectRatioY                       0
>>           bmInterlaceFlags                 0x00
>>             Interlaced stream or variable: No
>>             Fields per frame: 2 fields
>>             Field 1 first: No
>>             Field pattern: Field 1 only
>>           bCopyProtect                        0
>>           bVariableSize                     0
>>         VideoStreaming Interface Descriptor:
>>           bLength                            38
>>           bDescriptorType                    36
>>           bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>>           bFrameIndex                         1
>>           bmCapabilities                   0x00
>>             Still image unsupported
>>           wWidth                           1920
>>           wHeight                          1080
>>           dwMinBitRate                 32000000
>>           dwMaxBitRate                 96000000
>>           dwDefaultFrameInterval         333333
>>           bFrameIntervalType                  3
>>           dwBytesPerLine                      0
>>           dwFrameInterval( 0)            333333
>>           dwFrameInterval( 1)            400000
>>           dwFrameInterval( 2)            416666
>>         VideoStreaming Interface Descriptor:
>>           bLength                            38
>>           bDescriptorType                    36
>>           bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>>           bFrameIndex                         2
>>           bmCapabilities                   0x00
>>             Still image unsupported
>>           wWidth                           1080
>>           wHeight                          1920
>>           dwMinBitRate                 32000000
>>           dwMaxBitRate                 96000000
>>           dwDefaultFrameInterval         333333
>>           bFrameIntervalType                  3
>>           dwBytesPerLine                      0
>>           dwFrameInterval( 0)            333333
>>           dwFrameInterval( 1)            400000
>>           dwFrameInterval( 2)            416666
>>         VideoStreaming Interface Descriptor:
>>           bLength                            38
>>           bDescriptorType                    36
>>           bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>>           bFrameIndex                         3
>>           bmCapabilities                   0x00
>>             Still image unsupported
>>           wWidth                           3840
>>           wHeight                          2160
>>           dwMinBitRate                111974400
>>           dwMaxBitRate                223948800
>>           dwDefaultFrameInterval         333333
>>           bFrameIntervalType                  3
>>           dwBytesPerLine                      0
>>           dwFrameInterval( 0)            333333
>>           dwFrameInterval( 1)            400000
>>           dwFrameInterval( 2)            416666
>>         VideoStreaming Interface Descriptor:
>>           bLength                            38
>>           bDescriptorType                    36
>>           bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>>           bFrameIndex                         4
>>           bmCapabilities                   0x00
>>             Still image unsupported
>>           wWidth                           1728
>>           wHeight                          3072
>>           dwMinBitRate                111974400
>>           dwMaxBitRate                223948800
>>           dwDefaultFrameInterval         333333
>>           bFrameIntervalType                  3
>>           dwBytesPerLine                      0
>>           dwFrameInterval( 0)            333333
>>           dwFrameInterval( 1)            400000
>>           dwFrameInterval( 2)            416666
>>         VideoStreaming Interface Descriptor:
>>           bLength                             6
>>           bDescriptorType                    36
>>           bDescriptorSubtype                 13 (COLORFORMAT)
>>           bColorPrimaries                     1 (BT.709,sRGB)
>>           bTransferCharacteristics            1 (BT.709)
>>           bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
>>         Endpoint Descriptor:
>>           bLength                 7
>>           bDescriptorType         5
>>           bEndpointAddress     0x82  EP 2 IN
>>           bmAttributes            2
>>             Transfer Type            Bulk
>>             Synch Type               None
>>             Usage Type               Data
>>           wMaxPacketSize     0x0200  1x 512 bytes
>>           bInterval               0
>>       Interface Association:
>>         bLength                 8
>>         bDescriptorType        11
>>         bFirstInterface         2
>>         bInterfaceCount         3
>>         bFunctionClass          1 Audio
>>         bFunctionSubClass       0 [unknown]
>>         bFunctionProtocol       0
>>         iFunction               8 OsmoPocket4P
>>       Interface Descriptor:
>>         bLength                 9
>>         bDescriptorType         4
>>         bInterfaceNumber        2
>>         bAlternateSetting       0
>>         bNumEndpoints           0
>>         bInterfaceClass         1 Audio
>>         bInterfaceSubClass      1 Control Device
>>         bInterfaceProtocol      0
>>         iInterface              8 OsmoPocket4P
>>         AudioControl Interface Descriptor:
>>           bLength                10
>>           bDescriptorType        36
>>           bDescriptorSubtype      1 (HEADER)
>>           bcdADC               1.00
>>           wTotalLength       0x0034
>>           bInCollection           2
>>           baInterfaceNr(0)        3
>>           baInterfaceNr(1)        4
>>         AudioControl Interface Descriptor:
>>           bLength                12
>>           bDescriptorType        36
>>           bDescriptorSubtype      2 (INPUT_TERMINAL)
>>           bTerminalID             1
>>           wTerminalType      0x0101 USB Streaming
>>           bAssocTerminal          0
>>           bNrChannels             2
>>           wChannelConfig     0x0003
>>             Left Front (L)
>>             Right Front (R)
>>           iChannelNames          10 Playback Channels
>>           iTerminal               9 Playback Input terminal
>>         AudioControl Interface Descriptor:
>>           bLength                 9
>>           bDescriptorType        36
>>           bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>>           bTerminalID             2
>>           wTerminalType      0x0301 Speaker
>>           bAssocTerminal          0
>>           bSourceID               1
>>           iTerminal              11 Playback Output terminal
>>         AudioControl Interface Descriptor:
>>           bLength                12
>>           bDescriptorType        36
>>           bDescriptorSubtype      2 (INPUT_TERMINAL)
>>           bTerminalID             3
>>           wTerminalType      0x0201 Microphone
>>           bAssocTerminal          0
>>           bNrChannels             2
>>           wChannelConfig     0x0003
>>             Left Front (L)
>>             Right Front (R)
>>           iChannelNames          13 Capture Channels
>>           iTerminal              12 Capture Input terminal
>>         AudioControl Interface Descriptor:
>>           bLength                 9
>>           bDescriptorType        36
>>           bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>>           bTerminalID             4
>>           wTerminalType      0x0101 USB Streaming
>>           bAssocTerminal          0
>>           bSourceID               3
>>           iTerminal              14 Capture Output terminal
>>       Interface Descriptor:
>>         bLength                 9
>>         bDescriptorType         4
>>         bInterfaceNumber        3
>>         bAlternateSetting       0
>>         bNumEndpoints           0
>>         bInterfaceClass         1 Audio
>>         bInterfaceSubClass      2 Streaming
>>         bInterfaceProtocol      0
>>         iInterface             15 Playback Inactive
>>       Interface Descriptor:
>>         bLength                 9
>>         bDescriptorType         4
>>         bInterfaceNumber        3
>>         bAlternateSetting       1
>>         bNumEndpoints           1
>>         bInterfaceClass         1 Audio
>>         bInterfaceSubClass      2 Streaming
>>         bInterfaceProtocol      0
>>         iInterface             16 Playback Active
>>         AudioStreaming Interface Descriptor:
>>           bLength                 7
>>           bDescriptorType        36
>>           bDescriptorSubtype      1 (AS_GENERAL)
>>           bTerminalLink           1
>>           bDelay                  1 frames
>>           wFormatTag         0x0001 PCM
>>         AudioStreaming Interface Descriptor:
>>           bLength                11
>>           bDescriptorType        36
>>           bDescriptorSubtype      2 (FORMAT_TYPE)
>>           bFormatType             1 (FORMAT_TYPE_I)
>>           bNrChannels             2
>>           bSubframeSize           2
>>           bBitResolution         16
>>           bSamFreqType            1 Discrete
>>           tSamFreq[ 0]        48000
>>         Endpoint Descriptor:
>>           bLength                 9
>>           bDescriptorType         5
>>           bEndpointAddress     0x01  EP 1 OUT
>>           bmAttributes            9
>>             Transfer Type            Isochronous
>>             Synch Type               Adaptive
>>             Usage Type               Data
>>           wMaxPacketSize     0x00c8  1x 200 bytes
>>           bInterval               4
>>           bRefresh                0
>>           bSynchAddress           0
>>           AudioStreaming Endpoint Descriptor:
>>             bLength                 7
>>             bDescriptorType        37
>>             bDescriptorSubtype      1 (EP_GENERAL)
>>             bmAttributes         0x01
>>               Sampling Frequency
>>             bLockDelayUnits         1 Milliseconds
>>             wLockDelay         0x0001
>>       Interface Descriptor:
>>         bLength                 9
>>         bDescriptorType         4
>>         bInterfaceNumber        4
>>         bAlternateSetting       0
>>         bNumEndpoints           0
>>         bInterfaceClass         1 Audio
>>         bInterfaceSubClass      2 Streaming
>>         bInterfaceProtocol      0
>>         iInterface             17 Capture Inactive
>>       Interface Descriptor:
>>         bLength                 9
>>         bDescriptorType         4
>>         bInterfaceNumber        4
>>         bAlternateSetting       1
>>         bNumEndpoints           1
>>         bInterfaceClass         1 Audio
>>         bInterfaceSubClass      2 Streaming
>>         bInterfaceProtocol      0
>>         iInterface             18 Capture Active
>>         AudioStreaming Interface Descriptor:
>>           bLength                 7
>>           bDescriptorType        36
>>           bDescriptorSubtype      1 (AS_GENERAL)
>>           bTerminalLink           4
>>           bDelay                  1 frames
>>           wFormatTag         0x0001 PCM
>>         AudioStreaming Interface Descriptor:
>>           bLength                11
>>           bDescriptorType        36
>>           bDescriptorSubtype      2 (FORMAT_TYPE)
>>           bFormatType             1 (FORMAT_TYPE_I)
>>           bNrChannels             2
>>           bSubframeSize           2
>>           bBitResolution         16
>>           bSamFreqType            1 Discrete
>>           tSamFreq[ 0]        48000
>>         Endpoint Descriptor:
>>           bLength                 9
>>           bDescriptorType         5
>>           bEndpointAddress     0x83  EP 3 IN
>>           bmAttributes            9
>>             Transfer Type            Isochronous
>>             Synch Type               Adaptive
>>             Usage Type               Data
>>           wMaxPacketSize     0x00c8  1x 200 bytes
>>           bInterval               4
>>           bRefresh                0
>>           bSynchAddress           0
>>           AudioStreaming Endpoint Descriptor:
>>             bLength                 7
>>             bDescriptorType        37
>>             bDescriptorSubtype      1 (EP_GENERAL)
>>             bmAttributes         0x01
>>               Sampling Frequency
>>             bLockDelayUnits         0 Undefined
>>             wLockDelay         0x0000
>> Binary Object Store Descriptor:
>>     bLength                 5
>>     bDescriptorType        15
>>     wTotalLength       0x000c
>>     bNumDeviceCaps          1
>>     USB 2.0 Extension Device Capability:
>>       bLength                 7
>>       bDescriptorType        16
>>       bDevCapabilityType      2
>>       bmAttributes   0x00000006
>>         BESL Link Power Management (LPM) Supported
>> Device Status:     0x0000
>>     (Bus Powered)
>>
>> The same symptom was reported for the DJI Osmo Action 3 with H264
>> on kernel 5.10, so this seems to affect DJI's webcam firmware in
>> general:
>> https://stackoverflow.com/questions/74692945/
>>
>> I am happy to test patches or provide more information.
>>
>> Thanks,
>> Jordan
>>
>>
>

