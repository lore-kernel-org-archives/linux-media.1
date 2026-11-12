Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794512594;
	b=S2yfPszNgbHzKLhCoz7fp/+40hmWncbZ+KD+/t3bLMaMPf8hWYJoK++SQDFapSKXDzL+
	 Ny/X8Nl10WHtQluvMDm+EJMEWGntCuZmHv/4XZcpsbun6+1F3eTleqstUotctxB2c4+oL
	 LvVq1r2tE9vFariUdG097R57KIfdKc59K108QLTlRgIk9goLTSFKwZCNUA3+fxAidXDJq
	 1ciKdk1itDTJFuk2vQj1Nrl5dmnrD23fbgWcEkKbU/lQHkCnfRSG0RbbgBWuOD16VW5Z0
	 Y7s+B51md6SYDqz3c4v7hU4LTQLcHfciJISQLPqyeHmYnV1x3edkSLdYHffW8UDUaRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794512594;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:Date:Message-ID:X-MBO-RS-ID:
	 X-MBO-RS-META;
	bh=lRk3BXCO6tXl1ER2Xz4bmyCZLQEV5fHAj9OeM3lJi44=;
	b=OQNYCq3+QS6tsEcxai3ikzc2b2RPCK3eg8EDI6KBq/yVEvxfAAb++9TR6YrRPLOAvYrQ
	 qA1DaWUAiErWW/INuwvIVB2Ix8pl6/JB23in3cu1UkyzU6EnwZhLuBnzDZLtr1icdBHQo
	 XGE4NOJpHhO34jpxtg1TQzqrBeMbFcf+bbr3bqjb29ZwvPThvl2s7J7EnD+oJDr3hTSB8
	 FhrBGaR/4C39UkChwaCpwI3gfOL1m6mM/Hi4gcGh5gFM+2xZe27yKXAStPUjbEfNwZDRY
	 aCVUMtxGqF7Nymc/oKUUsMuxxxSlBBq+pk1A+3bJ9y16B+DbUbwEXoQlMI1hgj9NeFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=epnxB+TZ;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF27606A323;
	Thu, 12 Nov 2026 19:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFF27606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=epnxB+TZ
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jQW5V2g6SzMltT;
	Thu, 12 Nov 2026 20:43:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794512590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lRk3BXCO6tXl1ER2Xz4bmyCZLQEV5fHAj9OeM3lJi44=;
	b=epnxB+TZPlAw1Y3NCe7cFldRDWr+UaahaHHlUOEsRVKZM8g23poCKSuiFm31zC4haC7UdV
	AzfPkvNpikYKhedRVBe5fY/F5OnPhtLc9asTPLJ4T/92LuLKsZCfrHfbbvLmYc3PaRd234
	YMI42FwZPu10H/y1d1K1wMBxVcC2kYAbgbv3GY/yRe2CP0tjNS6BiQJbgCAUcOddAIul9l
	fR4Q6Vcwm06OWtLwwgOAi42uoIZxSSEnZnq66b93XtbVRVDjQiKw2mpEKp6aGFuWttAMQw
	qucOcd/zeRMY7CMBcVAPjaC/D31Fa52oqHAzVva8/UH+/3FGdWCFr1Bw0rHYmg==
From: Tobias Hahn <tobiashahn@mailbox.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject:
 iris: sporadic DATACORRUPT capture buffers on SC8280XP (HFI Gen1) - report
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 20:43:07 +0100
Message-ID: <179451258799.2463797.7572309153748586766@mailbox.org>
X-MBO-RS-ID: f0780ada2f800c71b5c
X-MBO-RS-META: u7gore13383ximzzzzd5pcgnt8ho9c67

Hi,

a short report, not a patch. As in my earlier mails: the
measurements were collected by an AI assistant (Claude) on my
machine; I ran them but have not analysed the driver myself.

Setup: ThinkPad X13s (SC8280XP), qcvss8280.mbn from linux-firmware
20260916, HFI Gen1, kernel 7.3.0-rc4 with the unmodified qcom_iris.

On long decodes, about 0.1-0.6 % of capture buffers come back with
V4L2_BUF_FLAG_ERROR: H.264 and HEVC 8 bit with the stock module,
and the same with 10 bit using the local change from my earlier
report; every file I tried. The affected frames change from run to run, and F=
Fmpeg's
software decoder finds no errors in the files.

The firmware sends these as fill-buffer-done with error_type 0,
filled_len equal to the full buffer size, and only
HFI_BUFFERFLAG_DATACORRUPT (0x8) set; nothing in dmesg.

Reproduce with any long 1080p file (a few hundred frames are
usually not enough):

  ffmpeg -c:v hevc_v4l2m2m -i input.mkv -map 0:v:0 -f null - 2>&1 \
    | grep -c 'driver decode error'

Happy to run tests or send the detailed numbers if useful.

Thanks,
Tobias
