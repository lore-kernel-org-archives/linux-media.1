Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287240;
	b=OOIlRSB0C+JqTRMoVVUddVmDq40xyJn+DdE7qFA9KuDcJdfuAoWnr3BYHG/KY0n4mZam
	 sMUkQmzv6FjlfUrEGmHHd0pwYuVfmTHbHi3DLvQvILKWfJCA8X2bhRa59THJUnSSWQGX+
	 kw9lQL+uHnrbBRCTaysOftI+vQvYZy6L1hmYQL0SJ0WmOUuzpyz/cjr7l/90FblP5mG0q
	 VsqxR+IoAau39oqPZ7Oe2ZpQ3sJKevJ/UjPSWbZjpFtww1uCSGp9zxPc/oE1aBZ+o2Akr
	 t0eEgUhHs7iKWILl5S74xKga4CSmXlArfS6I6RULqZz5kEb/FG2gx13qltM/sDsrFyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=QT4bclINJ0XwePdBF0j8i0qUtWKAX0rsicd/worsTPo=;
	b=Dmm//v+YCgqP5ZUZJsG8jIBFLwCACpcfGnXwgoh1nDOACICux7/HZn2WhLf2YUB7fmxR
	 k/DVSXNxs+ZCz947oGwsFD9iKoD87K0sdNE3C+41gLEmiJsxbGgSEgVMu8QE4BV/apEij
	 pzLL3SbTeH3lgebpt5OytD2P3pYIzqpz3ga/jGYDjtZNsGs49r/T3HxKAyp/lKJvEFwKh
	 fEkf/00wUhjs0rO1lh4SOdguiHBf+/9xiWGlupt9f1Rfh1qdToHtqQkJCrrE1g+iC6m9Y
	 VU6LFMBQW5QhekYaSS0gRpcXFixxrIqdDUPVa2uFqAXp9xzpPQaMN7BZgc0sqWV0TZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OsaqZc3A;
	arc=none smtp.remote-ip=209.85.219.71
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74490606A322
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 15:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74490606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OsaqZc3A
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c7e4f0848so40916346d6.1
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 08:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793287239; x=1793892039; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QT4bclINJ0XwePdBF0j8i0qUtWKAX0rsicd/worsTPo=;
        b=OsaqZc3ACuQuwDJrM/1w7W05tNrOJjrntgQwkuae+gKp6Z9RYgm839tLKIkpYZJMLT
         smVnO7BA2Uo0X/1Vmvchfh1SGgCeBrwC+Cy5NCFltxN7eMuUi2MQe122Qd7N89f9X9fM
         gsjiHAtM3oVqqWY92h3b7fmQYqDJQWN4hUZnbD1dzyqF+OIssHGqIbdHiWiItu293uEG
         P8rgoefGTpJqgEpzP/E4Zn+gp5fhmxlbqv0Vn12OUud+Ecf1IVLZjQsSBriFFCXQ0mTH
         MTNJU7Mim5OLTdGPVkaUMghgjz1ZWmyuu7YuTAN5xjH0qRHEzFSSP23vFopLQd9bH3PU
         aqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287239; x=1793892039;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QT4bclINJ0XwePdBF0j8i0qUtWKAX0rsicd/worsTPo=;
        b=gaeTf0je4my9ucBTbIa5UgnfuspKVM5wsxqDCOGvA2doDLtmhzbL8zi+ovGuixIFJJ
         8eSX3SVONnOoPdLJlDQ63lCOn8csdGaHhRtECTHMVlhpwqa9iye4NUmf6Sn3EpUl0o9Z
         2VEkMg/21FEAla0VmWPJ8DVOQ0vzFcC7amnMrk1gBWaGw/cZy1VgdjjJmASffQe+O7co
         ttU6Hq01NmOCt5vxLR6qccarHUTyAfUpQg0wNFXHwRTFTSJo/qLD7c7gsaf+BQfydsqR
         C5xvWz/mI4yXp8favOPiYt2Bc3LiuNxc9QBAVNxbMmsmIN7ZMapigDmKouy0FYAY8VrY
         Mvcg==
X-Gm-Message-State: AFq9FYINgGjDeufC5zHnE8b7MMdVUES9TNOnI9pvB2AklD222V5JEc/o
	VfisSH9360vJi2PtphO3su6CRQX+qFRsTfA2txaISiOxmSnIcgBHvY1dseWAxZ40vVGFPBpMYFP
	A4p02xciwVn+TW91xmMMmcMjCN9cAUlE/OCWoGupobIeVdDKn1CnohxAHWlF4L/Ncr6l6Qhbnem
	kPkxr7JFDWyKJWAjMNki+VEBOjj7cvVWvfltfdCYkRrKnzpWDrjblanOKv8e//81QKvjbc1XcjR
	A==
X-Received: from qvbdi13.prod.google.com ([2002:ad4:58ed:0:b0:917:9b09:89e3])
 (user=briandaniels job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6214:3017:b0:91c:1647:41eb with SMTP id 6a1803df08f44-91c7d1b818fmr94603466d6.43.1793287238665;
 Thu, 29 Oct 2026 08:20:38 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:20:20 -0400
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261029152030.3764241-1-briandaniels@google.com>
Subject: [PATCH v4l-utils v2] v4l2-compliance: Add an option to override the
 driver name.
From: Brian Daniels <briandaniels@google.com>
To: linux-media@vger.kernel.org
Cc: hverkuil+cisco@kernel.org, Brian Daniels <briandaniels@google.com>
Content-Type: text/plain; charset="UTF-8"

When using the virtio-media driver, the host and a guest VM are used,
with the guest VM proxying requests to a host device. The driver name in
the guest VM is reported as "virtio-media", when really its proxying
requests to a driver with a different name (for example, "uvcvideo").
For the test to pass, v4l2-compliance needs to know the driver name of
the device on the host because it changes its behavior depending on the
driver under test.

With the new --is-uvc and --is-vivid options, the name of the host driver can
be overriden so the test running in the guest can adapt accordingly.

Assisted-by: LLM
Signed-off-by: Brian Daniels <briandaniels@google.com>
---
 utils/v4l2-compliance/v4l2-compliance.1.in |  6 +++++
 utils/v4l2-compliance/v4l2-compliance.cpp  | 28 ++++++++++++++++++----
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-compliance.1.in b/utils/v4l2-compliance/v4l2-compliance.1.in
index c23e5323..2e89b049 100644
--- a/utils/v4l2-compliance/v4l2-compliance.1.in
+++ b/utils/v4l2-compliance/v4l2-compliance.1.in
@@ -178,6 +178,12 @@ Highlight OK/warn/fail/FAIL strings with colors. OK is marked green, warn is
 marked bold, and fail/FAIL are marked bright red if enabled. \fI<when>\fR can
 be \fIalways\fR, \fInever\fR, or \fIauto\fR (the default).
 .TP
+\fB\-\-is\-uvc\fR
+Run the tests as if the detected driver name was "uvcvideo".
+.TP
+\fB\-\-is\-vivid\fR
+Run the tests as if the detected driver name was "vivid".
+.TP
 \fB\-n\fR, \fB\-\-no\-warnings\fR
 Turn off warning messages. They are still counted in the summary, but you won't see them.
 .TP
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index d6c2f61d..e9e84363 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -66,7 +66,9 @@ enum Option {
 	OptExitOnWarn = 'W',
 	OptMediaBusInfo = 'z',
 	OptExpBufMediaBusInfo = 'Z',
-	OptStreamFrom = 128,
+	OptIsUvc = 128,
+	OptIsVivid,
+	OptStreamFrom,
 	OptStreamFromHdr,
 	OptVersion,
 	OptLast = 256
@@ -85,8 +87,8 @@ bool show_warnings = true;
 bool show_colors;
 bool exit_on_fail;
 bool exit_on_warn;
-bool is_vivid;
-bool is_uvcvideo;
+bool is_vivid = false;
+bool is_uvcvideo = false;
 int media_fd = -1;
 unsigned warnings;
 bool has_mmu = true;
@@ -132,6 +134,8 @@ static struct option long_options[] = {
 	{"help", no_argument, nullptr, OptHelp},
 	{"verbose", no_argument, nullptr, OptVerbose},
 	{"color", required_argument, nullptr, OptColor},
+	{"is-uvc", no_argument, nullptr, OptIsUvc},
+	{"is-vivid", no_argument, nullptr, OptIsVivid},
 	{"no-warnings", no_argument, nullptr, OptNoWarnings},
 	{"no-progress", no_argument, nullptr, OptNoProgress},
 	{"exit-on-fail", no_argument, nullptr, OptExitOnFail},
@@ -265,6 +269,8 @@ static void usage()
 	printf("  -h, --help         Display this help message.\n");
 	printf("  -C, --color <when> Highlight OK/warn/fail/FAIL strings with colors\n");
 	printf("                     <when> can be set to always, never, or auto (the default)\n");
+	printf("  --is-uvc           Run the tests as if the detected driver name was \"uvcvideo\".\n");
+	printf("  --is-vivid         Run the tests as if the detected driver name was \"vivid\".\n");
 	printf("  -n, --no-warnings  Turn off warning messages.\n");
 	printf("  -P, --no-progress  Turn off progress messages.\n");
 	printf("  -T, --trace        Trace all called ioctls.\n");
@@ -998,8 +1004,10 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 	if (node.is_v4l2()) {
 		doioctl(&node, VIDIOC_QUERYCAP, &vcap);
 		driver = reinterpret_cast<const char *>(vcap.driver);
-		is_uvcvideo = driver == "uvcvideo";
-		is_vivid = driver == "vivid";
+		if (!options[OptIsUvc] && !options[OptIsVivid]) {
+			is_uvcvideo = driver == "uvcvideo";
+			is_vivid = driver == "vivid";
+		}
 		node.bus_info = reinterpret_cast<const char *>(vcap.bus_info);
 		determine_codec_mask(node);
 	} else if (node.is_subdev()) {
@@ -1830,6 +1838,12 @@ int main(int argc, char **argv)
 				std::exit(EXIT_FAILURE);
 			}
 			break;
+		case OptIsUvc:
+			is_uvcvideo = true;
+			break;
+		case OptIsVivid:
+			is_vivid = true;
+			break;
 		case OptNoWarnings:
 			show_warnings = false;
 			break;
@@ -1869,6 +1883,10 @@ int main(int argc, char **argv)
 		usage();
 		std::exit(EXIT_FAILURE);
 	}
+	if (options[OptIsUvc] && options[OptIsVivid]) {
+		fprintf(stderr, "Options --is-uvc and --is-vivid are mutually exclusive.\n");
+		std::exit(EXIT_FAILURE);
+	}
 
 	print_sha();
 	printf("\n");

base-commit: be3d75c02de67a75d2a8cf4e5e1e70b6faa798dd
-- 
2.56.0.317.g454f8302e1-goog

